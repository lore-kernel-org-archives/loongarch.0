Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5112942A;
	Tue, 26 Nov 2024 06:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732603516; cv=none; b=jt+S/NlPv24aOjE6j+uX0M84rFnd2lxwJRx0ic9prPKjn6AR8RH8VsQqaCjQBXmSmifOP+KbaDJG3jJutmP8sLGkwiYhVw5HBW9OLdo8dr4tMOhsBUXLfmwB3Ya3S9AMywhDQNCvV8v511WmiEGZLYDyBU3tFxk0QnxLuQkHbEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732603516; c=relaxed/simple;
	bh=UApXdMs85Hi+SPZFC4P5g8g07mgYvPth/K1DSn5DShQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1zWySb1IoqGyk0PJDs0liPHAPNaK5Q5uwiD1fJto4QqRI/8fHTwwBYT2WcgTBMqEqvYkc921K2nE+LOVl1clyBl0pJ4igzYSfYodaBU9czEIStmpbfr5WYHrNDhTM02cCqWw9NY3KydPJ9z/bLwD1ANdZ3iFmxoLkgAM5YHVZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaHsVxek; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaHsVxek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDFFC4CECF;
	Tue, 26 Nov 2024 06:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732603515;
	bh=UApXdMs85Hi+SPZFC4P5g8g07mgYvPth/K1DSn5DShQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SaHsVxekmmYGC3h3ch/sT6mOF0ziYOi8PLOJ5YZzK7wWROuF2UXV/WoN3bwYioSCg
	 z+Q9CuNEFzzN2dtjnJOUq8oyCUn51EtT+KTC9i97MV0DRzoaOp7H/rrUbsHD1g882r
	 ZPNrdWMZjOrCX6wG/A7ZhxDvDHNKZASkxei9OV6w6Olp+Ux+LEQyqenCnDgyq7HCWg
	 Nw1BYWEWwlqLztAzZ3fNriD2Ha5KeopxkajfTWMStUIXoeWSj+Toi0436kJnkk7QIp
	 Ax4APviHYMjhan6ZYiq3GsxlYE5VFvSqDnDyp7adexNsxN7SQTTOmTIYiCqZNZ1pbR
	 baVpWnZ/35IpA==
Date: Mon, 25 Nov 2024 22:45:13 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/10] objtool: Handle special cases of dead end insn
Message-ID: <20241126064513.bf6yq56eklyo4xvt@jpoimboe>
References: <20241122045005.14617-1-yangtiezhu@loongson.cn>
 <20241122045005.14617-3-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122045005.14617-3-yangtiezhu@loongson.cn>

On Fri, Nov 22, 2024 at 12:49:57PM +0800, Tiezhu Yang wrote:
> There are some "unreachable instruction" objtool warnings when compling
> with Clang on LoongArch, this is because the "break" instruction is set
> as dead end due to its type is INSN_BUG in decode_instructions() at the
> beginning, and it does not set insn->dead_end of the "break" instruction
> as false after checking ".rela.discard.reachable" in add_dead_ends(), so
> the next instruction of "break" is marked as unreachable.
> 
> Actually, it can find the reachable instruction after parsing the section
> ".rela.discard.reachable", in some cases, the "break" instruction may not
> be the first previous instruction with scheduling by Machine Instruction
> Scheduler of LLVM, it should find more times and then set insn->dead_end
> of the "break" instruction as false.
> 
> This is preparation for later patch on LoongArch, there is no effect for
> the other archs with this patch.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

I'm having trouble understanding this commit log, is the problem that
the compiler is sometimes inserting code between 'break' and the
unreachable() inline asm?

If so, this sounds like a problem that was already solved for x86 with:

  bfb1a7c91fb7 ("x86/bug: Merge annotate_reachable() into _BUG_FLAGS() asm")

Can you check if that fixes it?

-- 
Josh
