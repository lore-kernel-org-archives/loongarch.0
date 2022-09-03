Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D4129A9
	for <loongarch@lists.linux.dev>; Sat,  3 Sep 2022 20:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18A39C433D7;
	Sat,  3 Sep 2022 20:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662236951;
	bh=M7QpgVO5KP1FoCxkFsp6o06tH6aumSa+3QenVb6HTYw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cnrBhT5FRJbr8E9anolRMULu9LJIQXdWs12AiiMC3xTz+L253VKd3iEgdj4tE+p5m
	 ZhZVoo+0G6y1kbNOtUHLNqzStNhKeIQPiB3vNlUOyMORPEQhbNE6RNCpA/x25rJzUe
	 2pYaD2P8CEMaJ1ZutEHsF01PaefhgOJ8KoobgqR5zTsaopmGmeRJDizKw15XZcvEYs
	 ObtklQ4beYLPATO1HTFrLRnC0DcV5cpBeogT8accu7A75RkfEQ9WAjUuFKb/v72L92
	 VkJU4qy6kWg6N/bzLUx2J7o07j44Zu8UtbcVo+xztwe7FVX6QD+OhQT3JJRVxlcMUM
	 v4UDWI+XmMAtQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0506FC4166E;
	Sat,  3 Sep 2022 20:29:11 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v6.0-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220903142823.3436925-1-chenhuacai@loongson.cn>
References: <20220903142823.3436925-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <loongarch.lists.linux.dev>
X-PR-Tracked-Message-Id: <20220903142823.3436925-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.0-2
X-PR-Tracked-Commit-Id: ac9284db6b7b4af150940186b633a233d4ca2bed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f0c5f7ea81202e997f321d59bdd0c3f5c12ddea7
Message-Id: <166223695101.8828.14070900267849576734.pr-tracker-bot@kernel.org>
Date: Sat, 03 Sep 2022 20:29:11 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Sat,  3 Sep 2022 22:28:23 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.0-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f0c5f7ea81202e997f321d59bdd0c3f5c12ddea7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
