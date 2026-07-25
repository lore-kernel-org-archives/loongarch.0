Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79AA3EFFC5;
	Sat, 25 Jul 2026 17:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785000330; cv=none; b=jJZLUlQuJuuvghO7wN7bRPHqas4P35O5pwTHHjyOXo8GID1Sluk2ml3Hl2ERO+avg2B3hJcX++MmpLFmDmWnPW81/6MCDTp+B/tJLPqqDdK/gRxc7P/+TGIHuznhBBcwRrq/NH5MGeHEd6wvfR2iqlxeRWSqUBATbvOaCnktsNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785000330; c=relaxed/simple;
	bh=8A9cub11mVRHKNbEWIe9RLS0k9ZLzftJZiz5lW+hEYU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NDGOPje7hxvr0Mzd8E5/TI0JHDrOOCTeM4ygc/M/xZjT1tebkNwIbSGe/Di1uU011n6k2dnhIHvhhRdFYsvIiYZvHLLm+Xi+mmKrXQIERGAPFhvXtEn3imdCMTd9iKj1k7sEJa1a4VFPTd/SFj7QW28uNt0DXUtHQ6q1jnF03c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXgv49LY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXgv49LY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD45B1F000E9;
	Sat, 25 Jul 2026 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785000329;
	bh=HAerAqqVGKG5pMjup5Rli4t0uA9uguIuDiFSvSQ5oIU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=RXgv49LYzf4rKpYrqUyQWOvVUlYmYaMu6dkKYtbtW9WSNqAUfpgb3WXGw/fbSHyWe
	 jEQAjIyC1KbjDqKat3+ZFZ1pRgRfbO5JL/ScABz5YJ4vMlJPeD1H+B8tJJjEW4VPNx
	 sHW377lxDR1nfJKhyv38tiF8ZrmgVrxpNdvMmW2Hjg9Te3ytRAQQi7I8SwPFR4avzO
	 5g08F1Ar5F9G7A3R2npPDacdetO/ez2pahFvbJHEAqzVGEzj0jXD6aKXAVIDYypTmm
	 YI8G7bhbE1tO+y9G/JloaWGCshVkgSouHIthXHoJ/1ZviRiWUHJfeOBYGPswZPM4eF
	 5rDpUa7elqItA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 89F7C38119C5;
	Sat, 25 Jul 2026 17:24:57 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v7.2-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260725103658.815114-1-chenhuacai@loongson.cn>
References: <20260725103658.815114-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260725103658.815114-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.2-1
X-PR-Tracked-Commit-Id: 91a70492c03040d51b36f595530d6491d5d6c541
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3fb11702e4b2fe9eaaed7369bbe7e63177cc04a6
Message-Id: <178500029614.3569165.6075673664777645319.pr-tracker-bot@kernel.org>
Date: Sat, 25 Jul 2026 17:24:56 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 25 Jul 2026 18:36:58 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3fb11702e4b2fe9eaaed7369bbe7e63177cc04a6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
