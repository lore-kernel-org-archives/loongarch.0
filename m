Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8725939E6E4;
	Thu, 30 Apr 2026 03:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519611; cv=none; b=BbFq5iqEGSHqvtXLahN0RtJmDM7M7vCPAVPyvaJucOitOHV2sKISWpbQswh51ogQRDsiQYlFU7W2QZWz41cauRcvHfKmja9QyNwG1ynxO7xefq2HqOtxQYGaMj96qa4HTZTznttNsrOqqKi5Mqw1ZmdvDL+ktCzkMneqqPrqMLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519611; c=relaxed/simple;
	bh=VshiWipAYtRyMnsD8HAzk//9Evvgk9O0E2BL+Z2O4pk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YwJRtAl9X1rXdED46SwEaNixCymRKBULCS9P5Ii115qgGRLALUPa/12n581VJ79P6suYcSMcffZVcwIt3AcGi+XBHEGMMkGX9WRq5EAY6yitqGNU9HpT6vqO0LKbOe7HC7im3RE9Zsweo3CS5vohP+tV/Ymm7yumjHDQqKrIFHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uv2UWaUz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uv2UWaUz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B9FC2BCB8;
	Thu, 30 Apr 2026 03:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519611;
	bh=VshiWipAYtRyMnsD8HAzk//9Evvgk9O0E2BL+Z2O4pk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Uv2UWaUzVbUyIkgswzPmfhdYjkOpDsLPU3O/WJGYuLPii0uH5tUW/52XxirKakoWd
	 UOuM2PUB7KOW1bgwglcr822uaES5i7LcF+WBOwNRSEheCp/iesotg9S5Mycm4t3zIa
	 4fGTEdM9Oszy1Jxg1CtvOsaJoKHw4RHWDdT87crP/eIybS4+63vm+Q+Yf5sPhl9mCM
	 Z1wnh6X3nJ8a4pe5efyJsskj4Qt+XmWPzBgBT+u1lUkn4POaCvOvYYiHycXgoFQrX0
	 qfjM3O2/8DQFXcpbsAs+5P0iEHUHGEOU+izl980r9KdymeYwT/hPa2KwEk5f9WaTSj
	 GXa9J+FBhfGjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9DD43809A07;
	Thu, 30 Apr 2026 03:26:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 09/18] mm/hugetlb: Defer vmemmap population for bootmem
 hugepages
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751956630.2274119.12592851885920371218.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:26:06 +0000
References: <20260227193030.272078-9-kas@kernel.org>
In-Reply-To: <20260227193030.272078-9-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:10 +0000 you wrote:
> Currently, the vmemmap for bootmem-allocated gigantic pages is populated
> early in hugetlb_vmemmap_init_early(). However, the zone information is
> only available after zones are initialized. If it is later discovered
> that a page spans multiple zones, the HVO mapping must be undone and
> replaced with a normal mapping using vmemmap_undo_hvo().
> 
> Defer the actual vmemmap population to hugetlb_vmemmap_init_late(). At
> this stage, zones are already initialized, so it can be checked if the
> page is valid for HVO before deciding how to populate the vmemmap.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,09/18] mm/hugetlb: Defer vmemmap population for bootmem hugepages
    https://git.kernel.org/riscv/c/209e6d9eb13a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


