Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B93739DBE1;
	Thu, 30 Apr 2026 03:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519610; cv=none; b=Z3N9jmioY1Z5LbwmJv2DR8GZ0NePFZjuMh5n+Rh42H4UgGrNfDjxg6Dx0tckYwxNQrNnO4AhzSsfNulA6Tv4NDG//RMXLKDiUHFykMQP7M/iFcfxWkbfxPqZ+z3jAzh51BbcMUMwBPOVqFIXrREBluDpO6bwt1So06KYkOJvYH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519610; c=relaxed/simple;
	bh=iFqroCI9QhrRjRPr6nqnuqqWoIPtsKBpJSs5D3LwRHU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XfhJqXTB95yudGqm1E8WlZvcuZLrTURhQ6vHbsW/qFMMe/yOtN1M2FuJHGkfgTaWDcDKb31iovvXJv/WHw/vvpDRHsnX7oTpW3w8LrJy5M7KMp+ZLWLAq/lMVRifnMz8WwI6DO572udPH3oo7oEgUoOgrh//dpCt7UTgxYYPTbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDZoBJBy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDZoBJBy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F82C2BCB8;
	Thu, 30 Apr 2026 03:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519609;
	bh=iFqroCI9QhrRjRPr6nqnuqqWoIPtsKBpJSs5D3LwRHU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qDZoBJByuNsp58dPyZrm1NWzEP6bDZxrt4juzc1Ayrev7wPMACk+uUM41eKdHbD5s
	 i6WA8mJHerklMdFyLbo0sLVn0Wn6JtNrrlu6qNz2XPV+xTwfEr2Ao33Ahz05lpp4G3
	 NHYs0GmngPzMGLvWDKQZbDWIYnpWyiSQgC7r0FnDEL/o/BYqTsd2fj/qa5a5riwjV/
	 qHReu8/iWe0Kzrh+UPBK8/K9grFHLk4eTC8pCN6N48Fw1G4diyvsMP/zpg6m8WwzEd
	 Wuvzr7EgyEvnskXgDxRM78pQgyr7y7kHNbprI6MzT+kmtUllYIlaB8//LC96wQV7Xf
	 WIQc8djoGzeYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FC563809A07;
	Thu, 30 Apr 2026 03:26:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 14/18] hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751956479.2274119.8317675820783174184.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:26:04 +0000
References: <20260227193030.272078-14-kas@kernel.org>
In-Reply-To: <20260227193030.272078-14-kas@kernel.org>
To: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 muchun.song@linux.dev, david@redhat.com, willy@infradead.org,
 usamaarif642@gmail.com, fvdl@google.com, osalvador@suse.de, rppt@kernel.org,
 vbabka@suse.cz, lorenzo.stoakes@oracle.com, ziy@nvidia.com, bhe@redhat.com,
 mhocko@suse.com, hannes@cmpxchg.org, corbet@lwn.net, chenhuacai@kernel.org,
 kernel@xen0n.name, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kernel-team@meta.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, david@kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 27 Feb 2026 19:30:15 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> The VMEMMAP_SYNCHRONIZE_RCU flag triggered synchronize_rcu() calls to
> prevent a race between HVO remapping and page_ref_add_unless(). The
> race could occur when a speculative PFN walker tried to modify the
> refcount on a struct page that was in the process of being remapped
> to a fake head.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,14/18] hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
    https://git.kernel.org/riscv/c/01b1d0ffb6f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


