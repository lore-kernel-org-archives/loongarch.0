Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434460;
	b=tV5G+nnxIXJg8fsUUhYxtZRt1a0mb4a7iwxF2elKsmT4KoD+stJoTLrXaSJHXrhD64TU
	 SzZwpkvDkuy7XqLbiWq3nRxe9FW1Hyb0qQxRssgNYA3hqj91c0kn5fOk8tS7/NcTmxRzL
	 4dii7G3Vj1rmeOWdq8i6nCVXMrLhSr8Zw3rin2loyECcWMvq4PpulOjiiYdFnoacFkhlR
	 buUquz8fTBX1j/SI4SxiHs+tXfQTOJTeCrsh1n1v45ANVHbl2Ax21LKMPxQwVDyygZZdz
	 aLIdrYpkNufaSozktbsVNm6TpYwNfiPz11zxF+35Ne1bqvkKbtcdSNQiP9wnh8GA5JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434460;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=8XAiWXGUUjdOqLPEz8B5qkEY7IIzdgIv8dHSwzYxyw4=;
	b=KEsSnx1Wx5gqmaOXJzdQmE8KBQYvrc9qj/Qog4SPMlzt0MqC/iybofM4f4x9hEnx/Blo
	 jijK2gDYNLpciZZdBK/LQzBug8A+Zdq/JPyZvqqDfR9yRvVEF/t2VszAtcq5s/o3SVfda
	 LEVkSrMXSXClhY5xKt6rnkYxfbhKHM4inOS+TLTQdJfdKzDmgCo787fayr+tvMw9/aGmL
	 GIWbeZhYVa/Wo+3DQryRnZsyoJquZyBdD43o3os4t5vGLFiEvEqJqYsSOejyWjNTH7Yhb
	 Rr6rLa5fPWxvcTuYpXjKDMeYjYZG4ll4pJvaWXoQQbZgFBVtM2dgGQMo7QR36WTSOAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jNxG+lRk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FCA606A890;
	Wed, 11 Nov 2026 22:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jNxG+lRk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34481F00A06;
	Wed, 11 Nov 2026 22:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434459;
	bh=8XAiWXGUUjdOqLPEz8B5qkEY7IIzdgIv8dHSwzYxyw4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=jNxG+lRky6MZZKND/V9WnPkb0TuJ4I8992hsoRue94RW99Am4JlkMaV6gz0UCBptS
	 JbqTwi7JZbD9x6IquJjLI2ceFzJe2kAFLtcr6EYMbAUq5q7xl3+aeDgP5QIqsGJ7RX
	 uk8WTOIp/OKIwDwMB76CTYJqadwe0WRG0DPvzxDEvfpClLbNGoeb9ThVNlQ+4npPgv
	 Tm34a7MDOGTbN2n4u1OUwjY2I7lwgLdUBC0ZDWU9PdiFg03aIldipdaJglyQMbom4t
	 Zvgc/riziUwLZtV2UYGki5VP9eOtMpL9jr9Z6Pj/7ZzbqIKRaxgwYl44rDFHMqjb/J
	 76Ph6zV42zGjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D8305391AFAA;
	Wed, 11 Nov 2026 22:00:59 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261111140535.3899978-1-chenhuacai@loongson.cn>
References: <20261111140535.3899978-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261111140535.3899978-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.4-1
X-PR-Tracked-Commit-Id: 422e532809572ba1043192bf6a0c653bc68b3140
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 79eb6679ef6a0d5ea68da53a8321fb1dc72299b9
Message-Id: <179443445882.1663589.5239313471674239048.pr-tracker-bot@kernel.org>
Date: Wed, 11 Nov 2026 22:00:58 +0000
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

The pull request you sent on Wed, 11 Nov 2026 22:05:34 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/79eb6679ef6a0d5ea68da53a8321fb1dc72299b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
