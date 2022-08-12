Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0852597
	for <loongarch@lists.linux.dev>; Fri, 12 Aug 2022 16:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2707CC433C1;
	Fri, 12 Aug 2022 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660323568;
	bh=/NbibNSjBiaNNE/GRC4vNh2B7UucCEwDLgHVEeyPnk0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rREFGGC59XPoE602SOSfiudmVGO2DVBY1fKEOW642+pP9e72DzmWxETPrH2JRgbTr
	 R5efR+ftQxaZ5pAosUrcIgZqEQODKo6YAG03YQSYuingeX9h//T3itH9o99W8qTDUX
	 RoMwkXjLIt3SANRuAb8/nnhTsOsFc+/4bSCm+Tq2t6ezBFqL+9FEw+bZbPJn2zzWTi
	 MHxrnWfjviOXmWfYKrNrmi/RQHUvJF/FQLNVnImENjpGk7FbuW/74iOgPGf96dzoj2
	 dshj4hyYNZOuVtyzi/uuSPK9AudJyzvbLwIWLxiQVK+ukbypwDiJcCtDr18Zlops55
	 LUY908bIqCQpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 14A4AC43141;
	Fri, 12 Aug 2022 16:59:28 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch changes for v5.20
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220812072403.3075518-1-chenhuacai@loongson.cn>
References: <20220812072403.3075518-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-arch.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220812072403.3075518-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-5.20
X-PR-Tracked-Commit-Id: 715355922212a3be8bfe5a94b5707a045ac6bf00
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 999324f58c41262f5b64d04b7ac54e8f79b019fd
Message-Id: <166032356807.14629.13071109960950383291.pr-tracker-bot@kernel.org>
Date: Fri, 12 Aug 2022 16:59:28 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 12 Aug 2022 15:24:03 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-5.20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/999324f58c41262f5b64d04b7ac54e8f79b019fd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
