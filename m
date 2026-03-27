Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5953451C1;
	Fri, 27 Mar 2026 23:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654368; cv=none; b=ivYCp5FglhLeErRlWXVi/C12aLgA40u+d+Q/u1uZMB/7Irsabp091uPpwLMxbUcQuyiiU4pk/WhP90cguMspNsZNtKdv6jl5PK06CmmnBMXTUT9U9l8gGINeuCWQH1O6cbl78WZvgI4hZM4TShT4otpheKVFNPjDrqwmdQht7WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654368; c=relaxed/simple;
	bh=3nLVGQfFnxHLbTudoHSZzDJlg1jo4j83vUTs5gif1LQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WopAKmfvXumZQcENbwOHN6YwEiPpIAj861mMHEH/c3uUYTU68YniX+AOSgSvfb59x2ilUlipqlQgc0fasWbNwN8gUoEmjZjYkTYvtPJa/cTTL6hOuk5dI8q4W9npRB05ZRbK9oKD+DPl0ANiFeK5T5RcXlkOSm6AmC16XYch5oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6WONTNT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6WONTNT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EF9C19423;
	Fri, 27 Mar 2026 23:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774654368;
	bh=3nLVGQfFnxHLbTudoHSZzDJlg1jo4j83vUTs5gif1LQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=p6WONTNT79NrcTY32VNV0AVGlpN/Q6b0pWjnzu4fhc+pYDHK4whqhXWoHNYkP7k04
	 VBGOJbhthZz14lDttGska0J2b3dxhwDWRFPQjc5k+c/k6gbNeo0D10LD6KqGg6z/3y
	 wmY+umvNH1TJqnHAk5tPRUcyLttS2Lq146w91bYqkH3Gzee5raX0YXZ46/ym1aXD7D
	 /Lxo4/gesJUmHf2FmfOhfTnpRt9FtxdDZ/5KBXdljc4uzQ4dL/gJzqJB21yDjmO2GD
	 JVlc9oDrdVdNsS8KOXvRzCLDBbsj6slehe7cwnNp1wP/jOOT/Oa/IQcBc2MR2orsD1
	 ZB+30+AznV7Aw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0EC9F39301F5;
	Fri, 27 Mar 2026 23:32:35 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v7.0-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260327150016.3076455-1-chenhuacai@loongson.cn>
References: <20260327150016.3076455-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <loongarch.lists.linux.dev>
X-PR-Tracked-Message-Id: <20260327150016.3076455-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.0-2
X-PR-Tracked-Commit-Id: 6bcfb7f46d667b04bd1a1169ccedf5fb699c60df
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a361474ba3b3c6bdca7bad72dfd2ffb4f11e8e1d
Message-Id: <177465435388.4116696.15904085599092908956.pr-tracker-bot@kernel.org>
Date: Fri, 27 Mar 2026 23:32:33 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 27 Mar 2026 23:00:16 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.0-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a361474ba3b3c6bdca7bad72dfd2ffb4f11e8e1d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
