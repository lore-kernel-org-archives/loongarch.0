Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E6F110C
	for <loongarch@lists.linux.dev>; Fri, 29 Jul 2022 18:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92229C433D6;
	Fri, 29 Jul 2022 18:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659119749;
	bh=7F1PDpeRGQFgkhTwqADv6QxlfNJDub32cinES52/dgI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rNl8uTr+MXxtlXM8als0SsguzzPHzzih6UrPP54gcclbwA+wJ2g67BR4Ll4JbpTfo
	 s6REJeycwqBmVGTDBRuRSBaNFi4qHjF6xg2FOB1sHqEwlfDZ6KJYTwcp2GQlsbBp1z
	 aewkcO9UauBGgw0gi9xzXHwC3JNm+Mnt41RfwrT14fs+LmudErQ6kDHr2BGTdFfQqM
	 WJV8x/YKmw8uElbVTaJTzHNp6O4m5xgfFZSVEisziysgTk0+MQfDY7x4dzzzfhWIW9
	 lfiSXKPTM4PlVxElwYUFaD33UOmhbp1Uq5RKc6ULaGGzCTqN+eL8t2COjHWQvn0Eyz
	 4mWtwP/NYDt9A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7EA58C43142;
	Fri, 29 Jul 2022 18:35:49 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v5.19-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220729144205.3412161-1-chenhuacai@loongson.cn>
References: <20220729144205.3412161-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220729144205.3412161-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-5.19-5
X-PR-Tracked-Commit-Id: 45b53c9051770c0d9145083a328548745ee2e75b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a95eb1d086dcc579d52ca4c34742516f6434d1f2
Message-Id: <165911974951.994.1693047203751898890.pr-tracker-bot@kernel.org>
Date: Fri, 29 Jul 2022 18:35:49 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 29 Jul 2022 22:42:05 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-5.19-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a95eb1d086dcc579d52ca4c34742516f6434d1f2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
