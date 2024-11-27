Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239B62F5E;
	Wed, 27 Nov 2024 00:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732668840; cv=none; b=A509wERPt2lOVmWIQiSN+fw2YvddwG2I78QTyCcNcrzLK/scj9nfppe7rxH9y7UC7iVCEvuggjcJlAOElKRzE+0RsMyw+PtiMlQGi80TIB5XM/taNe8YHTfLTuhemcrviuIciOiF7ML6bqNJq5piKPV2/GqC91iRyJeJyBql7MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732668840; c=relaxed/simple;
	bh=C8S08yN+r8oUm1wa0cn6B4uwDRykeAeYSefQEvM/euM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKkgKsi/p7GY8Qi6AaQSaDUq3tz/rZ6V5XSEi0zoSPkcw0gmGBwRMDC6jMwG22qfxZwZOqkQBcJG2PZMS/9Yuoi5Nu/cangd3LIbGkUO8UukqlCWT5FUv0Cmzp4MwtJx03i65TKZgkDz2M9XSeep0BXK4G8TRljvZXiF951CNX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hk3dzP6/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hk3dzP6/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFF2C4CECF;
	Wed, 27 Nov 2024 00:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732668839;
	bh=C8S08yN+r8oUm1wa0cn6B4uwDRykeAeYSefQEvM/euM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hk3dzP6/7bEV81QuTn4LSv4J9Ag3So7vTvtO2R1jaLclL/O19lB3Jl7Sv+pGuonT3
	 PXNMb0jtL3MS0cqvM3wsmWIM3XBR4HEbcMv/PuCNLqF2RYbUsoA7y2NgfOrinZJ+zY
	 z4q56jouaTBtkl8dQDlTTkJLYWtKDIQ6sk3OirRp3XVKEs7MGJTReKqhWF9HQCuFdz
	 M2mphoxehCOlYxCKYDA1HprFv5BIX4hINXz3wL2Z22CxPEg8EDf89MHwL5JX+6aQgZ
	 I4BwuYwnSXrbdq7mcoQU4iFeybtcXq5VUaGr98k91cxX/8pblrcvCgzSMafQNJZWtv
	 UPs2Tbz7gkCqQ==
Date: Tue, 26 Nov 2024 16:53:57 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/10] objtool: Handle different entry size of rodata
Message-ID: <20241127005357.w7sgf5x5grss42wx@jpoimboe>
References: <20241122045005.14617-1-yangtiezhu@loongson.cn>
 <20241122045005.14617-4-yangtiezhu@loongson.cn>
 <20241126070214.26gj5fnsjx5b5vp3@jpoimboe>
 <e56d48c6-172d-5b31-86de-98384fe58e98@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e56d48c6-172d-5b31-86de-98384fe58e98@loongson.cn>

On Tue, Nov 26, 2024 at 06:59:38PM +0800, Tiezhu Yang wrote:
> > Can this be abstracted out to a reloc_size() function like
> > so?
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/tree/tools/objtool/klp-diff.c?h=objtool-diff#n834
> > 
> > maybe it could live in elf.h.
> 
> OK, if I understand your comment correctly, this should be an
> arch-specific function defined in tools/objtool/arch/*/include/arch/elf.h,
> otherwise it also needs to check ehdr.e_machine
> in tools/objtool/include/objtool/elf.h.

It should probably be an arch-specific function in tools/objtool/arch
somewhere.

-- 
Josh
