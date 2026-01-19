Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D0B2D978A;
	Mon, 19 Jan 2026 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831036; cv=none; b=d5/DcAxK/B9svbHG0tt34dStESzcDVErk5svSMa0KAY6YyTBaBl+VAxA4xIpjhJqgNO/T/fTtLqscd7hS+FDybj+wDG5JZ1ks4/VCWdCI2ane7hlSDM0RCjzS0iw7WJjcUa0pc/YS2Ce8ILRQ+02Lsld8uACEtWkBbICufVKRLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831036; c=relaxed/simple;
	bh=2DP9CKWWHdhyGwKeaeCXNcp+7xJmbB+W/il1HGyyDUI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lelyhmLJhEGbOOHMi/QGgRLGs+kUQeCbyLIq3E834gU/yFbyHBLoWzE45N57V0LizLnw8lJOhlTYOvYrjFqv5avd2Bslrvl/qOrEZi0/VlsykSIkiczc6Q5BYpPhMs4k7TemburPatbp/9x/VPDXzeMvsrnHFIf/XLwsAR9n9kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGUZP6S/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGUZP6S/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16F6C19423;
	Mon, 19 Jan 2026 13:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768831035;
	bh=2DP9CKWWHdhyGwKeaeCXNcp+7xJmbB+W/il1HGyyDUI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=AGUZP6S/paV9NzGy7j8InxuQobkWVhM/xyW8EJy7Tz+vzjA0n6z38ORxCMoPZNAgM
	 Usg0DAuXqEJxkfYf6sq8oVoyCm1UuWfK6mJh5gbJnKW4J5WuORbD1tyrNU25ngWkA5
	 PYqBnhWSQ+ie1+lU8fGDqlZfW+PYOllgrO2oFC4GrPhjmbiCEaiuFNCJEOq4YO6y6p
	 6TsShwZ8LcvG1B+/c3FUVydCMqyVaq3wXRvsB074FqoQaiNd6Juko2DJkBdJ6uv6nK
	 2Rvwq/9nvZWdAQV0KcGtY7GrKk+i/BAzwk9MZiRiUuvOvxaHbsuiXnIGREY/8b484T
	 /X6tlWWOFMOmg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BAFF03A54A38;
	Mon, 19 Jan 2026 13:53:46 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v6.19-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260118014803.754974-1-chenhuacai@loongson.cn>
References: <20260118014803.754974-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <loongarch.lists.linux.dev>
X-PR-Tracked-Message-Id: <20260118014803.754974-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.19-2
X-PR-Tracked-Commit-Id: 1cf342a7c3adc5877837b53bbceb5cc9eff60bbf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 47622aa8b66c8fb2af4aff584c3c7c17ca0686ea
Message-Id: <176883082530.1423140.13540812708924299989.pr-tracker-bot@kernel.org>
Date: Mon, 19 Jan 2026 13:53:45 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 18 Jan 2026 09:48:03 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.19-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/47622aa8b66c8fb2af4aff584c3c7c17ca0686ea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
