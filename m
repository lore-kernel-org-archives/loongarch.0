Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1C6330666;
	Wed, 18 Mar 2026 17:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853213; cv=none; b=Ezzc2c6uw1LJ2ZBmEeY4zPr8X4SyGj7sAna8a/FCNYET5c7cNGjj4EBDvPtCN6qxNJDGnojxs1MYMMjM14W/wrrYTUNHNfwzYAeBFDPhw2MZYvqGux8aOLu1LVAEQwFr3xmuEKDDtjkf5aYq6TRhldanN4d1Bis5T5KjvkWnKhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853213; c=relaxed/simple;
	bh=3w4/8hgFQ0gdaIiC4YcNvFSadWwojll8qdrYV0NlzSs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GdfzGodISUS4OwED1Datx6bJTYEXNbWPHhRNnCcAfT9yBhSb+ZesOZsHyXbqf8OQAFbO4UJjCPasNO7kUwUhYOGYSB5zFKN+LE43bdojl+P6EdP9QoVfN2so+5ENINoruKauMyPVuhc2X6GNoDbHIu5TrrpAKt8qZb95ImLC/ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijdUvmma; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijdUvmma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97D5C19421;
	Wed, 18 Mar 2026 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773853213;
	bh=3w4/8hgFQ0gdaIiC4YcNvFSadWwojll8qdrYV0NlzSs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ijdUvmmahkUWwQTchjB88U/7W0Xtw7KsY7X99q+cs9JQxmV3awU6uFJ6emSrIuPTD
	 SoCR12ZXcNwkEMiiVEbRhp3BoSNBcSUBNg8/55m9CZ6U+IZCEwGlHqfY3XcA+A/0C6
	 7dzqBUqInaqgvXicu7PoyjelgFydMGZ9UNSC0AdHKdBmn0D8WqToT3uGPW1BmqM1+6
	 ublUifReaygfJQyQxTxqXq1ezMu+JRhCoQAXWfEKbyNhi+ZnBHPw7fUXOflgzSOF2M
	 zPvxwV4G3AnFs+ETgTQx7bG30INCsddPooMRWAIrf7tDQc6MjOC90pShunwLbPgIId
	 AY+W/HsjYG8vQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF8D3808200;
	Wed, 18 Mar 2026 17:00:06 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v7.0-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260318042101.626343-1-chenhuacai@loongson.cn>
References: <20260318042101.626343-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <loongarch.lists.linux.dev>
X-PR-Tracked-Message-Id: <20260318042101.626343-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.0-1
X-PR-Tracked-Commit-Id: c252c12d1f55bd5737e3b8e7839914ccdc7a701c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: efa0adb5041591a3bf63e30b36239e4537211222
Message-Id: <177385320512.796867.9524142252718417109.pr-tracker-bot@kernel.org>
Date: Wed, 18 Mar 2026 17:00:05 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Wed, 18 Mar 2026 12:20:56 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.0-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/efa0adb5041591a3bf63e30b36239e4537211222

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
