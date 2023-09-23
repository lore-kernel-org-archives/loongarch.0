Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FD8208AF
	for <loongarch@lists.linux.dev>; Sat, 23 Sep 2023 18:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17D00C433C7;
	Sat, 23 Sep 2023 18:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695493517;
	bh=CWScgxauEeU1V9K8in0JUbKpAezkwPw3KQV5e5EnTGg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nLaLICsnY4ns8jmm2auxROXtEpsyXkK9ReVPm6ha46bnQnoxcKmahjvUnuRM/7O/1
	 ocus4+qYpv5IZ3Wjn4zVEioQKoCEgvrTLMQ0xkQ/arHloAcY5LlGIoWO2U08A7S7Ut
	 AdHZlfgQib/X/PJasHh71im6DI175c6EIarLFhMWN92eEkYP6QNI26aaz81ukvuYRY
	 bl8WoAagOfRfPSLrOEHbv0RpThlf3XsKuwF/2L2ZDM6NGXgIMHOX37xnmZNMcrl6bl
	 cSDIXh/LOFxYFSJzW3cGiXShcQ05/ZV5DPrgOh0iXIHbc3oyXr5BrWX9ZJWPyWo0Kq
	 1JR4q0+IxayRw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 01FE5C40C5E;
	Sat, 23 Sep 2023 18:25:17 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v6.6-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230923091031.1075337-1-chenhuacai@loongson.cn>
References: <20230923091031.1075337-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230923091031.1075337-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.6-1
X-PR-Tracked-Commit-Id: e74a6b7f3744d122ff4544f19393dfab167166ec
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 93397d3a2f1bc67eeff6a6ca0c59e628d2169f41
Message-Id: <169549351700.14827.15256542913924124578.pr-tracker-bot@kernel.org>
Date: Sat, 23 Sep 2023 18:25:17 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 23 Sep 2023 17:10:31 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.6-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/93397d3a2f1bc67eeff6a6ca0c59e628d2169f41

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
