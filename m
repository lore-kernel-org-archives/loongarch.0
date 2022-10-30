Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3463208
	for <loongarch@lists.linux.dev>; Sun, 30 Oct 2022 18:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14375C433D6;
	Sun, 30 Oct 2022 18:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667154887;
	bh=cc71OaFw+A9BTCDPRol6dG3BLxYSQczj+DJjfznqgUs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=oV8H0zEiuyTezp8HiXf5FVGKbTVtLgo6TiT80kWirz1AUrWptiITcOYOiGQAR0vq2
	 2a3/3XrTLcrMCLG9uvofppSabTS+gTDsSyxFrMHnisawhel6uk6tNXormYR3tcGaJF
	 WU7jUzHf0ntxyUohiVDQNiPqnVPQbRX219NS6WyHXrSA1QGFqRmdICOUDnzhVpo73E
	 0zRZdHCA9YCN0+mFoomVa0CIROQjE9tycfMR1nQNvn3z8ZApI+adnJgOzd/LHa0ufj
	 jrT2WTYAdX0KKuizP4vv4/20+pYOlRv6Kfs8123CACLmLNN8NfQaUWSr8zVSXkrt6h
	 xQj4v76IkXhZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ECF5DC4166D;
	Sun, 30 Oct 2022 18:34:46 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v6.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20221030091658.1843946-1-chenhuacai@loongson.cn>
References: <20221030091658.1843946-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221030091658.1843946-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.1-1
X-PR-Tracked-Commit-Id: d81916910f7498fe7a768697e0101d488f9fe665
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c96bb958fb13fe2e0d16da86f6a21d9171a6db06
Message-Id: <166715488696.31922.779857326579249823.pr-tracker-bot@kernel.org>
Date: Sun, 30 Oct 2022 18:34:46 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 30 Oct 2022 17:16:58 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.1-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c96bb958fb13fe2e0d16da86f6a21d9171a6db06

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
