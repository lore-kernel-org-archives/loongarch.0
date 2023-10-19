Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D01939852
	for <loongarch@lists.linux.dev>; Thu, 19 Oct 2023 18:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSTa+LUS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5A4AC433C8;
	Thu, 19 Oct 2023 18:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697740576;
	bh=v2W9P4t8t3zNYgO1q1TE+P02uqNlmhYpi0lDTNyHrJU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iSTa+LUSbvdfbSkeXN+w/pZrSGXxLXC2n0WiztmEm6m3OGIGZGuEwGDgDBm57flXr
	 cBBFNjMit/JsBLaq33nHSZcU9GK0KCsc886MkqXGoW8TnGKIbM+8ZehZYbWScmyVDs
	 CvGdeRyxXQtg6a8wErMZyHkV2iUM+miJ+iWRPZtInkKaONy9ED6S+mdwU1XG3d8pGV
	 0srH3A5UKl81Y052B78fhB28gB67rXFUa9Qut2FhDxckPTghH2ea9/tynlYEDw59oT
	 HrR0jImjU4L7iyIpAwBGcTHwVmEVYLERBCDkSbGUGp9xBjuHr35XtvcsZTihmFs/aY
	 ZTu857JmABb9Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 971B5C04DD9;
	Thu, 19 Oct 2023 18:36:16 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v6.6-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231019084227.4111684-1-chenhuacai@loongson.cn>
References: <20231019084227.4111684-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20231019084227.4111684-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.6-3
X-PR-Tracked-Commit-Id: 278be83601dd1725d4732241f066d528e160a39d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 74e9347ebc5be452935fe4f3eddb150aa5a6f4fe
Message-Id: <169774057661.20290.11492595041951746156.pr-tracker-bot@kernel.org>
Date: Thu, 19 Oct 2023 18:36:16 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 19 Oct 2023 16:42:27 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.6-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/74e9347ebc5be452935fe4f3eddb150aa5a6f4fe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
