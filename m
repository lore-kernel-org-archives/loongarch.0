Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9771C30F52A;
	Sat, 14 Feb 2026 20:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771102449; cv=none; b=Tb50Ays1pFDKybe9D1XCJxjnvek+PHlMapo2XYh316p7ShOCYwlqse7MBgQZ2R4xWacTlQ6k7/OkhzDAOzXWxuJfDutswPeQ9+V+0dw/jtjyRPUR7TQ5QDBw8CEQ0QTQaQI2aO4zlr/VjQvVPEkI6B/Xw3NpAolUvuru1cXgNo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771102449; c=relaxed/simple;
	bh=/X5j0/V8oagcD0kaOY4bRUYm8NK814rvm1aiJ3MgG+A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=agfWDJY0ovlul0YJ0pEML8L3O7zYACgnmZTCPPBbw/n4n1aI+4Ufz9mKbDaHMNjQW6rD5w00qzCX7ggw24Jy55/MGipuaBJHlHxZIGCHRJ0B2gPqiJivT+QnZyMXQCa5XMNm52lIWsYqVtPQNTqGpcFzN9JmXOhesEQrlMtFWEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeekuZv9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeekuZv9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777BFC16AAE;
	Sat, 14 Feb 2026 20:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771102449;
	bh=/X5j0/V8oagcD0kaOY4bRUYm8NK814rvm1aiJ3MgG+A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=AeekuZv9V6BUGhDpYxl7qqaioe/DGnFgcDmmH+JhGMiuaV0tfR5sL84yNjW47KnWI
	 8PxbAxx81JSjv8zeXsZFX3Jrk4h0pNlITObNbur0kt21jBK2RyWaR3fUsNH+zO0eVL
	 zK2EKASrUEoRWkBdV5VwuOZBgG2Zh/QHDmBfnC0eeCyTD2XR/yoVdbr4WsCvk81i1M
	 s1a0z4kON1NfXaYUBmMEk3zioakwMIFEcigNSNjVnISrGuZ/kRy9FPRT2FTRg5wYQf
	 Wklfgh4fAaJDinsalqWgAgF0XuRYTfaV+ECZyJAwV4OEYm3B5QGqw6Jdth+suU/DPp
	 2vYFHC4MoBYxg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B269393091E;
	Sat, 14 Feb 2026 20:54:04 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch changes for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260214131533.865218-1-chenhuacai@loongson.cn>
References: <20260214131533.865218-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <loongarch.lists.linux.dev>
X-PR-Tracked-Message-Id: <20260214131533.865218-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.0
X-PR-Tracked-Commit-Id: 92860256402cce9fa6268763365f5333a56c1428
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 64275e9fda3702bfb5ab3b95f7c2b9b414667164
Message-Id: <177110244258.2897141.10712297788280145163.pr-tracker-bot@kernel.org>
Date: Sat, 14 Feb 2026 20:54:02 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 14 Feb 2026 21:15:27 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/64275e9fda3702bfb5ab3b95f7c2b9b414667164

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
