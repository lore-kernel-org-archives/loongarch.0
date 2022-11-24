Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B3333F9
	for <loongarch@lists.linux.dev>; Thu, 24 Nov 2022 19:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBA8DC433D6;
	Thu, 24 Nov 2022 19:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669317389;
	bh=bAhsQsbumyLiUXdtQPY1//XoFduq0FSOMtUuRyCzq9s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=j3aQIx96E6ciqrq+lhU0IOglTBVRrYwMWooB6WnANS9K4hHgX1jvYKMgtylcG/hw5
	 uof2JX2+r2+gSw8BYc9/VIKLj9I4P0mwJUj7uSO+XczyfbXwu4zq1t5seX7xEvBds3
	 4OVo6ouNIO3XE+IamGKTjB5/5Af7D9wyjrJCB9+R7RQDr7hZKsW/zHuGvbIYxVBO84
	 MH+lvhAGYoWoQ8yIXPOTC+meu6MSbmZZLPvyWwCcJUfQRmOQBidska+qnjMio8tQR8
	 b11VYR6LCWRB/3ugF+pbsdq3pFxkrNUOSC0FDxDtodxGFWtOa7XkmStdId2H0Mu9H+
	 vxSah3LtFiDAA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AA2B7E21EFD;
	Thu, 24 Nov 2022 19:16:29 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v6.1-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20221124095120.3116780-1-chenhuacai@loongson.cn>
References: <20221124095120.3116780-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-arch.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221124095120.3116780-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.1-2
X-PR-Tracked-Commit-Id: fa0e381290b134da53e65fb421b65825f23221b4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3bfd8fcab548659e3a77000b2302c62a47ab2824
Message-Id: <166931738968.15670.1849929994501511702.pr-tracker-bot@kernel.org>
Date: Thu, 24 Nov 2022 19:16:29 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 24 Nov 2022 17:51:20 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3bfd8fcab548659e3a77000b2302c62a47ab2824

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
