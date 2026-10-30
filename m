Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793401828;
	b=jjw7DPGSrhSYAdEAlLR3qD9TAqe00ILidY7cJM3vGdlUVnipRpAnpkWlslIUYh7eOsT8
	 NoQ8DCEFnWzBsMmTj525wtoPEj3gTFhBSj1Ez1VcDdsjihCo3hkTcBNeY/0fKz0OLvakd
	 454VuYGCVofaluOySCPlwnkq1gsmj1zPM+NUv0aRwX0QmL7dMNUZxYZH8f3adUZLo4Vy4
	 rNZG1+LdlchT/jFCKO3/7FQ+ekN7H0NDExIdhExxNsikOmL2D2uJ0j2XPuGD61Fw7SW+S
	 J494FdcBKmD2DfGnyzi3JZtAWU/7Y7rU1RpijMaOdFMkS/7Y8gI4wzjz0iACvHZiO0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793401828;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=FOOPF4NTkfFCMW+7iFGEX6RTBjaDe8ACYAxm4ucyncE=;
	b=wmUDc9WJs6rqHIeU7M7NZVWFkZo0p092FGleJQQkvFFs+8Zky6HSPWvzBiiUPScIX7XQ
	 lDeB3A446VfX2GWOYJ/PCQDiyq7/lEGsI5IBRD80hlaVP2mQPCKfbWF6/gEw6GwwK2jd+
	 LaIlarVo8HqLK/qb18NHMsk0Jzm9M6TRUYunuWZH4PQFIqoVtY9eXT6l95MJnLvVZdQV6
	 kEGqQZCSzspK9RJh5HuAdXScxoFM4xm4ACANaNjslKlQvlARBdbk3SLkX3vbtzYd6fEvO
	 tx7Nl63D+0i/NTRoNCVU0DJV/Tw8+7OMWkU2KlosACq7gOquuHTCxDjYQO50bdTKR2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+BZDlR4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3114606A31A;
	Fri, 30 Oct 2026 23:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+BZDlR4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0E51F000C1;
	Fri, 30 Oct 2026 23:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793401827;
	bh=FOOPF4NTkfFCMW+7iFGEX6RTBjaDe8ACYAxm4ucyncE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=B+BZDlR4dAEXwQR9yuQA5xFSN7pipAaWOCnwd31U4Uvya93YBSgqQkARr/Yc2NhXi
	 wJLmHjSrH2wLW6kKytQldP4kGHJ7qNriQ1q+UEQce6K0MTdAvQNVq3iLsMd0H2yKS+
	 LckOIbc5bwjeEhzrElGbedGTANoWjODUjXOzTU0eNEIqsb1HVODbF3HFFY7A4CAwX/
	 eJ72+gMlC36z+vwDasiEN7u8Aprp8+z7j56er7F99hYvJEv/J9b+A+1AFgqIOpTMNa
	 5d7PZwP52cD+kYcR3HOvlzB07mgmteu+ULayRjJYqTL5erwnSC7smNw/HGkne3L8Gi
	 n/CBjrHueEpyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 42B893800478;
	Fri, 30 Oct 2026 23:10:27 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch changes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261030042753.2101956-1-chenhuacai@loongson.cn>
References: <20261030042753.2101956-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261030042753.2101956-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.4
X-PR-Tracked-Commit-Id: 6f8d12bb1a1231dbba579932772701880745a21d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 780cb2a5fd64901444878cf5a40c0f2ec54837ce
Message-Id: <179340182662.1820250.8181252458187794729.pr-tracker-bot@kernel.org>
Date: Fri, 30 Oct 2026 23:10:26 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list

The pull request you sent on Fri, 30 Oct 2026 12:27:53 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/780cb2a5fd64901444878cf5a40c0f2ec54837ce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
