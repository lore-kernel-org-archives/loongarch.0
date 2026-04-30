Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830503537CE;
	Thu, 30 Apr 2026 03:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519575; cv=none; b=lxe4rnsuXO0ZVev1+Ci9rBFbXknybOO/NNK2Of1KbC0xTFQXWaw8hB4TVf2mU3KCMm5KMVKrMUWHgBoIL6Yg9KuAU0UMenu8jXQ47w1lDKFJuaKpYZWK7q/HNFoaoDImVnSpXyCq+YtD26iHOFL4ErhB6C8QT0/98voE1QQxXgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519575; c=relaxed/simple;
	bh=smOY6pVVDHq+6KTLdCSD+6r2J5A4soRjk1OnTI5ZlHM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mSW3YfF3ydADrN90p2asiZGMZZtMiBdDSMoKoZ5qdw8PT9r7sl9JOt2X1L3UoDLSVOm2Li8RVRVtv9X2WELwqJ+XZj5elpX/vr3Q6gmqLUKCUfW2slcPOtVx9Uqxty/hrBbc4RW+xajW+hYx5u99v/KHU3ehUrkVPKXbiKs83k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlIOoBl7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlIOoBl7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CBBC2BCB8;
	Thu, 30 Apr 2026 03:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519575;
	bh=smOY6pVVDHq+6KTLdCSD+6r2J5A4soRjk1OnTI5ZlHM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dlIOoBl75hOEvwa9uZFaZ+vWlsAdTS39VaV4zcZr1mzQxorM426fS9+fb28XtX88C
	 mIMu8bSZblyQBO31WlUqBz/lLMExGlKNb2t502quWMfL1IhwIaR/AD0zsN8a+NTHJ6
	 zmf4ytfrdcHkQlThMspBfvMBQDI0tL1x8xlIkXHVW0gMUhTWpoTSTiWboBMAsfLejF
	 xMSpymzn8EpJxwfu8ylIwFEzlUqynLBRHPUrG3gQLEWB71MSDyIjlXH8YvuULeIEX1
	 QjYiMQ3POVX8oQTp1LZaq859UmwFqPiAefqkYOMchJ+U9DxQPoBfsXiabOdjSMuvQk
	 U0dvV/7SEMN8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E8D3809A07;
	Thu, 30 Apr 2026 03:25:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 15/18] mm/hugetlb: Remove hugetlb_optimize_vmemmap_key
 static key
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751953040.2274119.2787096861157625411.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:30 +0000
References: <20260227193030.272078-15-kas@kernel.org>
In-Reply-To: <20260227193030.272078-15-kas@kernel.org>
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

On Fri, 27 Feb 2026 19:30:16 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> The hugetlb_optimize_vmemmap_key static key was used to guard fake head
> detection in compound_head() and related functions. It allowed skipping
> the fake head checks entirely when HVO was not in use.
> 
> With fake heads eliminated and the detection code removed, the static
> key serves no purpose. Remove its definition and all increment/decrement
> calls.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,15/18] mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
    https://git.kernel.org/riscv/c/da3e2d1ca43d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


