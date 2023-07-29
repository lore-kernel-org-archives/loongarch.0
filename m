Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5473D60
	for <loongarch@lists.linux.dev>; Sat, 29 Jul 2023 17:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AB47C433C8;
	Sat, 29 Jul 2023 17:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690650275;
	bh=a8AgcCcRD45MqMrA0ShR610p4UCbpkmD952pgL1ofb4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZnpQ/avbGW7zt73h82czRQr4dD3GubVhffSqbE2zpw4AaI+2ZQ0ID4IfFwv0vrbl5
	 uVmwZrAc3zblP42KXpmrucLy7UomCyd83rZ67OnyM4DtS4+TlRLs7VPEOqvdPY7bqt
	 sMQQfgznw4zM9eH9QMdB428QQwbuNdHsCmZNURfiWCFIXUOy9A0LSE6Z3CR/zz2efk
	 j0POBEIq4j30FV0LZmUBkrf0BAQZxoPNXJyC7SionjHbMsVwuygqek0lvnAjAOLQob
	 QrvBGhMkvVrj1bYEsrJDhxwmwC/kMvIxHZPPcDmglr6ajdSHRqEhNFTHlQAwPjr4px
	 /7o4nZzEknjvA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 445DBC43169;
	Sat, 29 Jul 2023 17:04:35 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v6.5-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230729031648.539276-1-chenhuacai@loongson.cn>
References: <20230729031648.539276-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <loongarch.lists.linux.dev>
X-PR-Tracked-Message-Id: <20230729031648.539276-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.5-1
X-PR-Tracked-Commit-Id: 1e74ae32805b6630c78bd7fb746fbfe936fb8f86
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 12214540ad87ce824a8a791a3f063e6121ec5b66
Message-Id: <169065027526.12635.13494935973363519311.pr-tracker-bot@kernel.org>
Date: Sat, 29 Jul 2023 17:04:35 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 29 Jul 2023 11:16:48 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.5-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/12214540ad87ce824a8a791a3f063e6121ec5b66

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
