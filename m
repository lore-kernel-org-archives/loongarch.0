Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7E129A3
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 18:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1686DC341CD;
	Sat, 25 Jun 2022 18:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656181806;
	bh=D+q0GY66KBjvz7Tf84fUYfo0NBFp+pvfXYyQjGeTVOA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XZSxEHW0iWYDYH7G7DhrGkNQMJG1V1QQ9DyVEhp/rzHUh5eYFFYj5a7wHoduGu/zQ
	 gh4ftbDhPuKflO6ZIJN/8z2GIk/2G5a3smro76VXfNxZTH2cSqVrjMlZ0MQZ4IYrz0
	 k949Oh3UoLhCHQf/aMvPT0YK0cIvvup2tjuf/Ps5HxIKLj6PbytQsQNjLJE7Nu73qY
	 o6CIgwR8tL8NKkP0CwgTvCBdEtfNg5agmJvLQ399zaeGy8xAbuVhfzqFC2swhoD4UA
	 6BxBh7B8gniUhUa4J9vT3CE5Ympm3NpWhEnSuPut4za1x5lsuPJ1s+3eR3KoOxDNu6
	 dOdSE+4jXHRyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 04FADE85DBE;
	Sat, 25 Jun 2022 18:30:06 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v5.19-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220625101720.3837334-1-chenhuacai@loongson.cn>
References: <20220625101720.3837334-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-arch.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220625101720.3837334-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-5.19-3
X-PR-Tracked-Commit-Id: ea18d434781105ce61ff3ef7f74c9e51812f0580
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cb84318baa063ffd11d4c5eec5c429c85855504a
Message-Id: <165618180601.26648.5792753231229306970.pr-tracker-bot@kernel.org>
Date: Sat, 25 Jun 2022 18:30:06 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 25 Jun 2022 18:17:20 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-5.19-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cb84318baa063ffd11d4c5eec5c429c85855504a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
