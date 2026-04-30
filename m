Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BC33815DE;
	Thu, 30 Apr 2026 03:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519578; cv=none; b=KXjp0W2b0DGr9NHHhJakAHWlaghW5GQ1/UOKNASeEJ/pLqo3Me0+mluAgO00bBFND4vsi/noCckIg+hc1wimgiPxDYS4AYtBxkKN5x6TfqxYLVIz8EGK6NN2A8l2AyflJ4qDWKhJRJI9YSm5bmyjXIvZYkOe1IVBYzcyFj9NQGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519578; c=relaxed/simple;
	bh=47f6wiWNhzOqt1LxqL7cNkDmVIEiOhL3j+AXGV6BKtg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NTZimTk2/nwONaFgEPIngt5hspLFv4w+xKGbK62X432fjyauyoTbOfuQqzcWYh1eaWIkBmmuciOSvlytCIfYoKKU/wEyUBDDfvT47J29EREGFKdhUjluUWvCDHHFa2NOy8k2OuAMsuilfXQG/uX84ItStaUe78Ht9BByuiTGl8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cl9E+pNF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cl9E+pNF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68319C2BCB9;
	Thu, 30 Apr 2026 03:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519578;
	bh=47f6wiWNhzOqt1LxqL7cNkDmVIEiOhL3j+AXGV6BKtg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cl9E+pNFzygSkS9LU/raL18uAT2/mdwVF0PbOkbJFVE2UnECPe1iib5UKDbz/VFiB
	 kCueQLkBhWbRQ6xkD5hfnrYJJitPDJ20v3dqbagbqe3Thwq9vPSamcXk64ppjOAWIM
	 0Odo3lSTHVNjv+zUtbfeUXCXcL5YKfO8ee7DlMznTcjH2rfmNDqS9UPzFzFor/KH8a
	 OLm6+qme5UNwIMLcImLlbQUQX7W7NQi3nQ/wDgUh9nvkufIp3vgnGETLL1SyXgrN2j
	 hnqogKGfQLce6UWx/XmYM1y2W8pzY9O+AwA1F4QkZ2h7SpSwvzzeWdQj+1RDLx16Tr
	 J5G98eNyx8p9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EBB3809A07;
	Thu, 30 Apr 2026 03:25:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 10/18] mm/hugetlb: Refactor code around vmemmap_walk
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751953329.2274119.9976334880562386444.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:33 +0000
References: <20260227193030.272078-10-kas@kernel.org>
In-Reply-To: <20260227193030.272078-10-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:11 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> To prepare for removing fake head pages, the vmemmap_walk code is being
> reworked.
> 
> The reuse_page and reuse_addr variables are being eliminated. There will
> no longer be an expectation regarding the reuse address in relation to
> the operated range. Instead, the caller will provide head and tail
> vmemmap pages.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,10/18] mm/hugetlb: Refactor code around vmemmap_walk
    https://git.kernel.org/riscv/c/c0b495b91a47

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


