Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AFA3F54AC;
	Fri, 24 Apr 2026 18:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777055586; cv=none; b=mAukrwMo4LpZMPWTb2FaX3CAOv5aiNOV17aamWBIVuHn8yugbG07zqDRK6M3W/zavoqC/PiU5ewOF0R26ozd/5urotUHDh02UxTeHOCHV5SnemfGwHkKZtQbkHdi7C/5mJjAleqk3ZiRoVQv4viojPgK6Jc+jcYUM/iaQKz3+ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777055586; c=relaxed/simple;
	bh=x/t8NcYnyz/Dmdwr1CA4KucW1I6z8FB/lr+3/JQ5RL8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=MtaXCxpNjq8eDEU9Zu6BRngk1wXcAgN8bn7bNaRjCLhTqDnXpSYeI+xIqbL0bKHY2QGiO8AkDtCHk0KOLZR0Zaz3PxfpawnFlQcH468uxahnQCZ7CKwnCcmN8z+t7XXEoe9R2YJxzAfZdLWb+hD0RUqTKK9WbY/nXMrs4UHHLME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onS86X4l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onS86X4l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B6EC19425;
	Fri, 24 Apr 2026 18:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777055585;
	bh=x/t8NcYnyz/Dmdwr1CA4KucW1I6z8FB/lr+3/JQ5RL8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=onS86X4ldXjbWvzby2aHaH3k8DwuPy7sJZKUNxK/YPqkLHBNzwbb2qEvt4UXQgdRQ
	 cczjRqeHia/YFE+YUMGZULLsbnXG0DPV0OcEGCnk0vJyj+JXCqKjd1wu7ipdPOiV/j
	 hWYxItt9tOCHhjPyR0COowF7Vvp1ge6I3uXNUO7INhGCC/F8JbMqgksY3tYGyeXN+/
	 kaU/Ee2GQj9WDDCPCUInvw3tnL2Ck7VpUVqGWKOzo8FpvUW3kDP3QkBvTP0KqRYzbN
	 myayl9P1/Sv0qyyTwntSm4tSFh42qpLN15EcgM9xr0xND17ZjW5Ay8D2UCiYPE0C6Y
	 68kdTjbwOg4Cg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D02D38119C3;
	Fri, 24 Apr 2026 18:32:27 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch changes for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260424041913.3035241-1-chenhuacai@loongson.cn>
References: <20260424041913.3035241-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <loongarch.lists.linux.dev>
X-PR-Tracked-Message-Id: <20260424041913.3035241-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.1
X-PR-Tracked-Commit-Id: 7939f96f26e96b69db1fe4e7c18537a679696358
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ff57d59200baadfdb41f94a49fed7d161a9a8124
Message-Id: <177705554599.1656274.15821802258667323847.pr-tracker-bot@kernel.org>
Date: Fri, 24 Apr 2026 18:32:25 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 24 Apr 2026 12:19:13 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ff57d59200baadfdb41f94a49fed7d161a9a8124

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
