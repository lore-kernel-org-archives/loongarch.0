Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398313876A1;
	Thu, 30 Apr 2026 03:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519592; cv=none; b=RGcR3SuQjHlF+lLF3VPRXunCbL3rODl1BDQWe8BUDLvPFy7kX3ldiR4/8lOPd2bebAQUG00i36cC2mwHWEl8i0ACIBFDkO1s9BIoubQ41RqVi4q0M423nmvh5JXR0iLr2Xb6j5OUTPv2JGe8Cjj5SNqu4dwRF2iEcBz+H6e5klc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519592; c=relaxed/simple;
	bh=D6nRuLlNtWNYvvWuUfjCi9f8beZLcFCcGwTLfTAZV1I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ArfbQlFtJglKKNmg0slxCeitHsAdimw9n7ER2WgD5wt6XLH6FJSgyUOjhT6Y/tdhYmA46jjyesDIB7YK+9q/QuUisD4dAc8RgbhR9REEszcA/lN00/soZvL2K1n3HGNaP2b1dHTUqKChMiqZN4IQ+g3rOdvvt2VPWmb2Mp8ZeHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wo1L0FAi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wo1L0FAi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF196C2BCB8;
	Thu, 30 Apr 2026 03:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519591;
	bh=D6nRuLlNtWNYvvWuUfjCi9f8beZLcFCcGwTLfTAZV1I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Wo1L0FAiDsetIA/SZIMY+AZ2u3wX74XqfiqwNIt6PNAuDwjaG2jrM05nbChaS/1w+
	 RCmeQ4j1ATh57HbuwNvIYf9y01C7fhsragL/4RLWcSfcjeArvpsZCIf4D1+2JzF+lu
	 QvlapmT1r6mGtpC/JBtb/i3oKWYqTNCWdDeT5Cjpio+S+IfZdGzYd1U9UsNmsiPiDd
	 SQqYDrMvbc6Q+NbWiVgZLofEOiO1goK2HygUtaTFo5Mcw/hy5zHqRYL31iLH4Ql9Yi
	 iOqQUeeCRrWIjMN41eaD8Tm3MbEk7Cm5c/f/cH4xsZ4sj0M9HzOVh3aiLNeN/s5MxX
	 eA864zTCr1jHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FCAB3809A07;
	Thu, 30 Apr 2026 03:25:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7.1 17/18] hugetlb: Update vmemmap_dedup.rst
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751954679.2274119.8307144944681814627.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:46 +0000
References: <20260302105630.303492-1-kas@kernel.org>
In-Reply-To: <20260302105630.303492-1-kas@kernel.org>
To: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org, alex@ghiti.fr,
 aou@eecs.berkeley.edu, bhe@redhat.com, chenhuacai@kernel.org, corbet@lwn.net,
 david@kernel.org, fvdl@google.com, hannes@cmpxchg.org, kernel-team@meta.com,
 kernel@xen0n.name, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, loongarch@lists.linux.dev, lorenzo.stoakes@oracle.com,
 mhocko@suse.com, muchun.song@linux.dev, osalvador@suse.de,
 palmer@dabbelt.com, paul.walmsley@sifive.com, rppt@kernel.org,
 usamaarif642@gmail.com, vbabka@suse.cz, willy@infradead.org, ziy@nvidia.com

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Mon,  2 Mar 2026 10:56:28 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> Update the documentation regarding vmemmap optimization for hugetlb to
> reflect the changes in how the kernel maps the tail pages.
> 
> Fake heads no longer exist. Remove their description.
> 
> [...]

Here is the summary with links:
  - [PATCHv7.1,17/18] hugetlb: Update vmemmap_dedup.rst
    https://git.kernel.org/riscv/c/fed8676ca2b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


