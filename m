Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CB638F927;
	Thu, 30 Apr 2026 03:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519597; cv=none; b=k+T9OyfhNj//1ZNcMcEas26hpGS6678jnq5cWXiIjqmPT/jk7BiAATOlPR4qyf5qCmHTYibMtChvN2esII0q2FKp3onU1Uqf5XYlKF+2iiYmcdL+DHiakTTp14daq7etrxsmMJs/6ROacQoRmBuIfQLh0zSyfxZ3w/SNJnA0OoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519597; c=relaxed/simple;
	bh=bc+dg0Bc8LDaQ9OEb5RjsesIcFKeDCO/6xovARLSG30=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=e2gzOzooa4ruTjvRVN+Ji3VZpVOa0daBGeS5ExFUSmf58lHK7TEYNwjhFayXJjR5t35lhCaeYFaHTs+md58RwmVJlyfkTVVC7Ax+EoWDnCQ4GFCPMpRmtl54uQ73t8zz9b7z+H98MeUpb/L8foZk+H/BIjxo1DmpQzozXV6FvNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geUpuuDM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geUpuuDM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF135C2BCB9;
	Thu, 30 Apr 2026 03:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519596;
	bh=bc+dg0Bc8LDaQ9OEb5RjsesIcFKeDCO/6xovARLSG30=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=geUpuuDMCyhCp6bEdcbfN0LxnZCUCG0dgvu3qA/x+vL21nkrLzZ8fbVpg72WGZE28
	 GW58cY5htqwvpdHnIBBxusd/QaNcLFa+lj440eecLAww3/Tl672LYNkzLLEjf/tTSC
	 BpJ/B2ryHel/66TKXqJYyWj2hlvJjZgUYAyyblpCJqEkiH+W7IzZtgCsm05BvXOqTC
	 7UXOUp/0g8nuPuEp/UKXTadmyETa8KxH8Ey5ukE8RHBtYyFcXm2Y2LcaUH2nkGobnw
	 UofVwlyT6LtPYOcYzQrW4VSyZ9ncKX38Ij7OlcUNxKwM+79KdZnCJOFbQp/inSmfSd
	 OIy8h9cqLZpvQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDD13809A07;
	Thu, 30 Apr 2026 03:25:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 12/18] mm/hugetlb: Remove fake head pages
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751955179.2274119.2481489263486900849.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:51 +0000
References: <20260227193030.272078-12-kas@kernel.org>
In-Reply-To: <20260227193030.272078-12-kas@kernel.org>
To: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 muchun.song@linux.dev, david@redhat.com, willy@infradead.org,
 usamaarif642@gmail.com, fvdl@google.com, osalvador@suse.de, rppt@kernel.org,
 vbabka@suse.cz, lorenzo.stoakes@oracle.com, ziy@nvidia.com, bhe@redhat.com,
 mhocko@suse.com, hannes@cmpxchg.org, corbet@lwn.net, chenhuacai@kernel.org,
 kernel@xen0n.name, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kernel-team@meta.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 27 Feb 2026 19:30:13 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> HugeTLB Vmemmap Optimization (HVO) reduces memory usage by freeing most
> vmemmap pages for huge pages and remapping the freed range to a single
> page containing the struct page metadata.
> 
> With the new mask-based compound_info encoding (for power-of-2 struct
> page sizes), all tail pages of the same order are now identical
> regardless of which compound page they belong to. This means the tail
> pages can be truly shared without fake heads.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,12/18] mm/hugetlb: Remove fake head pages
    https://git.kernel.org/riscv/c/622026e87c40

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


