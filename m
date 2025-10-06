Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3451D33993;
	Mon,  6 Oct 2025 21:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759784441; cv=none; b=tqtOTZJp8bz9oDOtZ5GEZULwof9TLx00e2+A3hho+wdbQnNfBX4np01sbgiNh3nzSi7sDxvUUJYJdssuhLEcbPLQqaMQsfISZkyv3mI77Ab+1ceB8DIIFYgRT5ZAEecDFn7wAY/F0q5WR1xBBoRdjpz7AXPEl8FmlB1pjTSbtVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759784441; c=relaxed/simple;
	bh=iDl8Zu3v0MQTZVTv9kzwnPwIBKpczrRYT9UDZln8bXU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=XuZE4sIRmxz5kgINoje2t2A42lsXweddI9jBp+yeCIkpUPiM4PUdq3M4LbkbUfTG0v+yj7+qoUGBn4eQBTTWCijUTuxqnaIqbSBKYx2JxaH0d0w+QlwYFFcFtIhFKe2D+C/L3MRB3rfSgm3o972qoO7TiZqg8jMjgGU9R48U3/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5FweuP5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5FweuP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A7BC4CEF5;
	Mon,  6 Oct 2025 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759784441;
	bh=iDl8Zu3v0MQTZVTv9kzwnPwIBKpczrRYT9UDZln8bXU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=D5FweuP5ozTtEsloMEgafIShW35PCKpsCAeHKk8BxkhRz2qL0wmwk17KDTPSsFeQ3
	 qcAVopsYY2UL+VM18WAGP7j97ppPWtoaGD/6HifP1sCl/qD08ORKLpxOu+sWPeqQsm
	 6tTSXTT/fg2BYnPIFFO+VSttbzIqHy8jbtRvkdS/l330kXEBTnkLwGTJzk3f6GodHh
	 eSRPMp1nBVOyvPXxOAm3Lvucaz3XkTuMp+T7md+v2lGftAaVgP09mATXtogeHHBmCh
	 HSgtFzvSMrw38LSHlVAP0/K+SMxv3R+ZCGAks0xa4fZ+CDWZ3yLDOyP31qNviSVzIa
	 pyhKWpWKzmLsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB42539D0C1B;
	Mon,  6 Oct 2025 21:00:31 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch changes for v6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251006141228.3534607-1-chenhuacai@loongson.cn>
References: <20251006141228.3534607-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <loongarch.lists.linux.dev>
X-PR-Tracked-Message-Id: <20251006141228.3534607-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-6.18
X-PR-Tracked-Commit-Id: 032676ff8217cab3273da56ee774b64c46b56b5e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fb5bc347311b1d78dc608c91c2d68327b0a1d1d4
Message-Id: <175978443045.1594692.4419604317572721635.pr-tracker-bot@kernel.org>
Date: Mon, 06 Oct 2025 21:00:30 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Mon,  6 Oct 2025 22:12:28 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fb5bc347311b1d78dc608c91c2d68327b0a1d1d4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
