Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361221;
	b=HY/ojgx/+oQem/ffIskOocnqwr21nJTNLSEfeJpYQ/evJ42NhaA0qt7CX1JS7gDrrjqj
	 lJy5Zz3dae6ptZlwLQ11fJKZ8wr4RZntMOUxy3U8DsFR/mLi2dnSrez7QD6ByA0UmbIOr
	 Oq6g5/0Ie6MiWdCsG2GIUn3t2GNRCUIztU8EX5ihiXdIOB+/maUulc3bk1Z4HiYAdy/CS
	 XoZ4FIgAktHcZkLGWc3K/8AP22S/jty5bAfgvNGBQjJCnwimjRLgPqIhSnj7k8SfnwSVK
	 JyR6OdLmbap3JB+eyyesdHm6T7mbOvYo0r3A8Af7iw9B4YynKsqYHHMfdsONOKSsVsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361221;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oLJHCEJ/Kg3bxSfLgZSUAEgI1pARL/D/gn1f00Ae+ok=;
	b=I2waomLavLBk4H9nU5yi3ekSiAssgR9nfiIYqBk1fveI/iraK+U9kqRhfFtxfjLzijHS
	 k7VjCT0d6njDZbiQgZJu6wPeIunEM6xx8Sq2NkrHyoz1jHDeAozxran80pvG0ZqYoaEdG
	 lXI8z96XvpOb6oPBojYc5UQ1vqEt4Pz2H30R9s3aFcC6GPcKlFIsjK/KR4WIBIxUctUBh
	 CAHPKrmf5IHuqHZHWn+XU0Tlqse0VVmAtgtzSu4AIUne2ZQDIwEncRrOYV+NemnUInn9M
	 N1wHgY25p+qUxAlTcK9LFz0meGZ2rkQHnygSwai9sBoAg4FM66AUBUmirpJPWVVp+wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZbx2v03;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F19760A260F;
	Wed, 11 Nov 2026 01:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZbx2v03
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651FC1F00A07;
	Wed, 11 Nov 2026 01:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794361220;
	bh=oLJHCEJ/Kg3bxSfLgZSUAEgI1pARL/D/gn1f00Ae+ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YZbx2v03TUvN/jlvNMNVqE8NL9fIogzqvldc+MpZuXy4HIGSpIWlclbL7D5RzoHsA
	 gyEk6bypVlrMhvT3RNfgJo8MAh7kjojX7VwhKpkrIJtsteaYgagqNps+gwlaQ01HmE
	 rmCWx4lLFbYi2fPIEOBJhdeicAlc4YSjjRM7eI2jW2FFuMjvlGwOF/+IKrKHyciv37
	 BfyuDQmTl8Nwmlq0KSNj+X97TreCGTOfm1n+YE+tebkrVwwHnZHNjTkGUzgj+XbHha
	 J76oI+9YPtlygcFqa8bkXIAtr1Om0kqtKl93PZAww+GapjyezHbX7K0hTrV9cl8lZK
	 odYJDPmsGamEQ==
Date: Tue, 10 Nov 2026 17:40:18 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Leizhen Zhang <lzsx618@gmail.com>
Cc: peterz@infradead.org, yangtiezhu@loongson.cn, chenhuacai@kernel.org, 
	alexandre.chartre@oracle.com, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] objtool: Fix undefined behaviour reported by UBSan
 on a defconfig build
Message-ID: <avPHcvpkqSqyMPRP@jpoimboe>
References: <20261110000255.1720945-1-lzsx618@gmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110000255.1720945-1-lzsx618@gmail.com>

On Mon, Nov 09, 2026 at 06:02:52PM -0600, Leizhen Zhang wrote:
> An x86_64 defconfig build of v7.4-rc2 with objtool built with
> -fsanitize=address,undefined (GCC 12) gives two UBSan reports from
> objtool, both on the normal vmlinux.o pass, no unusual input involved:
> 
>   arch/x86/orc.c:11:18: runtime error: member access within null pointer of type 'struct cfi_state'
>   special.c:84:18: runtime error: load of misaligned address ... for type 'unsigned int', which requires 4 byte alignment
> 
> 1/3 fixes the first one: init_orc_entry() takes &cfi->regs[CFI_BP]
> before its own "if (!cfi)" check.  2/3 is the same pattern in the
> LoongArch copy of the function; I compile-tested objtool for LoongArch
> but have no LoongArch object to run it on.  3/3 fixes the second one:
> the feature word of a 14-byte packed struct alt_instr is read through
> an 'unsigned int *', so every odd-numbered entry is misaligned.
> 
> Testing: I relinked vmlinux.o without objtool and ran the old and the
> new objtool binary on two copies of it, with the arguments Kbuild uses.
> The old one prints both reports, the new one prints none, and the two
> resulting vmlinux.o files are byte-identical.  A full rebuild with the
> patched objtool is also clean for objtool.
> 
> None of this is a security issue: objtool only processes objects from
> the build itself.
> 
> The two reports were found with UBSan, and the analysis and fixes were
> prepared with the help of an AI coding assistant; I reviewed and tested
> the result.
> 
> Leizhen Zhang (3):
>   objtool/x86: Move the cfi->regs access after the NULL check
>   objtool/LoongArch: Move the cfi->regs access after the NULL check
>   objtool: Fix misaligned load of the alternative feature word
> 
>  tools/objtool/arch/loongarch/orc.c | 6 ++++--
>  tools/objtool/arch/x86/orc.c       | 4 +++-
>  tools/objtool/special.c            | 4 ++--
>  3 files changed, 9 insertions(+), 5 deletions(-)

Thanks!  I will queue these up.

-- 
Josh
