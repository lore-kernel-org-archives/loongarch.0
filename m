Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8994823A2
	for <loongarch@lists.linux.dev>; Wed, 19 Apr 2023 14:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C46FC433EF;
	Wed, 19 Apr 2023 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914730;
	bh=wi/AV48W74QRjLpGGYRXPZLAQytA8ph0D5nXcFfgVCE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ElN0T7OTRIrqotC09Pk58jMyr4z8y2+gdk0P/MnoDnOgMto44BQ69jtfEl6znOkxg
	 QGzOzmIcs0TJ/TDbR3X9wRj2YDrfJobolwTWYWHxak51ou4en6RKrb75c3XnnhBKaQ
	 RIIuafSCi/PEY0uCaUKoZ/4rwIRIkXVQh6Y4VyMc9Y5V0FALPTo4dvB+K7jwsh2RIC
	 HC108HwyrnTiPLnKlncx2UBORGAHM4z0IyICBnHoTnRgeeblkmUM+G9iAyccTYEx01
	 hqWK1yLbcLBWGYrYckgKQljKGF5CQPjyAnbchg8aWshFWwhBguOXqNW1tknOrsrbU7
	 oTiM3+Bvc2ryA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 084A4E3309C;
	Wed, 19 Apr 2023 14:32:10 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v6.3-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230419100517.3647508-1-chenhuacai@loongson.cn>
References: <20230419100517.3647508-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230419100517.3647508-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.3-1
X-PR-Tracked-Commit-Id: b5533e990dd1de5872a34cba2f4f7f508c9b2ec3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 40aacb3183ff74e15940189ff9a998a93b5ca76f
Message-Id: <168191473002.24893.12479676381030875611.pr-tracker-bot@kernel.org>
Date: Wed, 19 Apr 2023 14:32:10 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Wed, 19 Apr 2023 18:05:17 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/40aacb3183ff74e15940189ff9a998a93b5ca76f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
