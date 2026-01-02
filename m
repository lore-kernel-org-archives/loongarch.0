Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1796D3A1E72;
	Fri,  2 Jan 2026 20:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767385318; cv=none; b=gxUXWwrJ+0bWI2AC9bLLGwLhQETIM/aRKQzIJ/mm8F1TJt/yq0JmgcUuLy3COQtUTFWex8LBkzfABM5ffkfkJ6HVi2hoyyuV9bvhkMGvHlP5KrPTy/AoiEX8k2Sg1Ec/XNw7NePLqWDbCoIhxg7Ft21qhUhknBtY6gCy7W+KEsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767385318; c=relaxed/simple;
	bh=1gADMs+H54SbTUdJ/XbvZkaoW8tRMjHP2Po+QPtjKA8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tpDp235c/l0hGh8pCe1y8aKm1FbzE3MlR2yww5kn2ofjC3BIQo93HjBdxU2dlyW6s4qS0HaMh8PBxGwB7Ej4j6kQ6oDfLrtLsV2ZXZuf35qmgBkMZHGWS2kJAdKeABua8YGJHWB0FMyMYeRYqLqOV5AtJbNrBqoPnG910agq/Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rAOnKECk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rAOnKECk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44BEC116B1;
	Fri,  2 Jan 2026 20:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767385318;
	bh=1gADMs+H54SbTUdJ/XbvZkaoW8tRMjHP2Po+QPtjKA8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rAOnKECkS9oS2IG6h1x6z76No4oJ9p4UJ955Reu1rxQlGnezkK2594fCfT+J1AiZK
	 xVcjYTKpcXaR7SK1zOoPAI0d/QqL21v8tvN9jsol188OaOHnFDLPkt/GXJeoSVTxXp
	 /layqQuzGGdzCZyPd8yYfGUgMRL1TKzWXEVuuEcHhh0VHwAzudRFgf/WFakz973wLI
	 v9DqUdjRSUhzAzyWE3du0gAOt0hXqn8rrKW0onDmkAQNjO9t/6lCRhNHwspY3Agy0/
	 9YkzE3rpWZKn2LPqfzqMLHWi0J8BKzzN+r5uLVuha3n773m8aV92xPWdZeYQJeq7Hd
	 gz5WKQ4dVFPuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BBC4380A962;
	Fri,  2 Jan 2026 20:18:39 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v6.19-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260102124218.2256215-1-chenhuacai@loongson.cn>
References: <20260102124218.2256215-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260102124218.2256215-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.19-1
X-PR-Tracked-Commit-Id: bb85d206be208bbf834883e948125a35ac59993a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b993744a972722b4e15b8d2afee1a053767f4dd4
Message-Id: <176738511770.3999225.17390909777094531472.pr-tracker-bot@kernel.org>
Date: Fri, 02 Jan 2026 20:18:37 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Fri,  2 Jan 2026 20:42:18 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.19-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b993744a972722b4e15b8d2afee1a053767f4dd4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
