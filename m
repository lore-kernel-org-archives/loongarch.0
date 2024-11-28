Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84966A48;
	Thu, 28 Nov 2024 00:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732752621; cv=none; b=fNto51KRzHHNZ7iTQNTHq+EHWbFGkgprnetAEqNIC/QpDfIXyrKz7Ap+WtuMAZwbxZ0OGe68FcNyFffjtaupkAUIxzcc7DeUDJcxGSWPbnsw3J0G1ksut/yRlGbmwp7wplIsW1qnO68GM7XntnAsk4Rz+glwrHH9Dopaf7xMA1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732752621; c=relaxed/simple;
	bh=3Qhtkti+V+rfSJ+3BQXWLXrVn7InnohSE6pTx1Fv45c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HO51I4ufDRugXNDurCDMANSfFaAjSkcZBVcCAc6VzUnHTx+8d3r3hYvspCUKjQ3mNFyecIGE5wJI4s5Ey+Y373MAe2rZ3kOgPaebT8xmkbmxsPtK4M7plU1YwuLfnkp8D1ljt7mA2qw88q1s5ZJYYptZd991GHLtk/lI/sRaIBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRcW1cak; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRcW1cak"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAFCC4CECC;
	Thu, 28 Nov 2024 00:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732752618;
	bh=3Qhtkti+V+rfSJ+3BQXWLXrVn7InnohSE6pTx1Fv45c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRcW1cakyJF1MVqLtjXBoMipNqTt+hDXkPJzbO5uB2ZNFfQg0c3MzIHltLJjHh2zc
	 6WgOGoUtqeFPtu3M/wX9CDvrrRAXhWMA0k/Bw9QWCrYetlmRtk+UNiAxmCXszcuR4y
	 QexDW8JWZ0sohbQfY+oZYMa0M8/BBPdaW4+ENQlF7nZub9VyGnHt2Wiey4IHE4MgcU
	 WZuac7+v4kqd06CdFpw4vbmghVnEyHbduHV8D21r3KQ6DIdKT+af5k+F8+pgcbueFA
	 WTb89DNW35lEhGNjqLyzBkO4rMm+0LeYO2y87v/LRORCyNcIbFio1FFjTr9yvWo6aJ
	 HVZz+5JtBi0LQ==
Date: Wed, 27 Nov 2024 16:10:11 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/10] objtool: Handle unsorted table offset of rodata
Message-ID: <20241128001011.sjedpn2zhrhy6y6i@jpoimboe>
References: <20241122045005.14617-1-yangtiezhu@loongson.cn>
 <20241122045005.14617-7-yangtiezhu@loongson.cn>
 <8cb35ab7-56d0-8e8d-5e18-1bc2b94aeeeb@loongson.cn>
 <20241127012042.by4g34m4twlfmove@jpoimboe>
 <53677c5f-2ea5-a227-66f7-b27c27665f6b@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <53677c5f-2ea5-a227-66f7-b27c27665f6b@loongson.cn>

On Wed, Nov 27, 2024 at 03:01:33PM +0800, Tiezhu Yang wrote:
> 
> 
> On 11/27/2024 09:20 AM, Josh Poimboeuf wrote:
> > On Tue, Nov 26, 2024 at 09:28:19PM +0800, Tiezhu Yang wrote:
> > > > +		/* Handle the special cases compiled with Clang on LoongArch */
> > > > +		if (file->elf->ehdr.e_machine == EM_LOONGARCH &&
> > > > +		    reloc->sym->type == STT_SECTION && reloc != table &&
> > > > +		    reloc_offset(reloc) == reloc_offset(table) + rodata_table_size)
> > > > +			break;
> > > 
> > > I think it can be generic, like this:
> > > 
> > >                 /* Check for the end of the table: */
> > >                 if (reloc != table && reloc == next_table)
> > >                         break;
> > > 
> > >                 if (reloc != table &&
> > >                     reloc_offset(reloc) == reloc_offset(table) +
> > > rodata_table_size)
> > >                         break;
> > > 
> > > What do you think?
> > 
> > I'm not sure, this patch is hard to review because it uses
> > insn->table_size which doesn't get set until the next patch.
> > 
> > Maybe this patch should come after patches 7 & 8, or maybe they should
> > be squashed?
> 
> OK, I will squash the changes into patch #7.

I remembered Ard already solved a similar problem when he prototyped x86
jump table annotation.  Can you pull this patch into your series:

https://lore.kernel.org/20241011170847.334429-12-ardb+git@google.com

-- 
Josh
