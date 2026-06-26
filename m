Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A8F3FBEBC;
	Fri, 26 Jun 2026 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782488762; cv=none; b=Ep0jjknTu5Y4sSJkMUaZ+uMoEcRGBTybPzlJp75IKD872cFneMtbcBh5aR3niiypkypRrvE4ET5MUPmJGnma2PzIS3numHf5FDTocWvHml4uF3vW2tApua1pvTmQtRbmMy5saQsc7xs/yST7hP9wf3fQgHjSuqKBT4JkbiTZjuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782488762; c=relaxed/simple;
	bh=CJwqEtdfRJX34wd0ry8j+3Jv/vzEDvBn2SCFF+ytdS4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZM1Ca1xYDkZVLtH0C9XDeFE/y7yqJGmAZaCrVFwSwbdfbseoFN2Q+ZxLPPyBk/l2prZABJfBi8Az8Q15wuaVE3Gz4s3czaO2K5fYBJFb7crRqCcb1wmVchyRmAxjo7+Iz9OkF5XC6ZUdl9FQJW8pCBbCcpYxnWNcWKqZJ/87zAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UO2K4THu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UO2K4THu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EEA1F00A3A;
	Fri, 26 Jun 2026 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782488758;
	bh=krRrUZmxOCkwuAeBH42IFqaVYnBwFatCyK6/n9xdZaM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=UO2K4THuvE1fdPL+1zKTF1HgHcZtR0deRsSeGpGZ6EbWiGdHZz3Voc60ysIL+IRC9
	 lfk30hzbQYl7klu217yzlQ/s47UhgBzJahN405+Y+7bWCqgkXK+f2D9tX6DUSoZ82N
	 q+hucMWUqzZtlMUj56OiXhOIU3ajyMRPlOthfXQ60ANTUXKJi4jGOHMwdk/T0zsz/z
	 Pzfp+U1eQsq5isiIJExBt9dxUhw4H4U9x2h+KbC2/VOpTY32DJYDIeqnFTWkDOVFWF
	 4pUKzSIBE9c/h26j8lMAVigw+L2agNVHgpULB8bCXZsxiYgk4m1ea58Ew9VUSlDi13
	 XdYgZs1Un7OWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93E7F3938C49;
	Fri, 26 Jun 2026 15:45:46 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch changes for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260626150605.3967536-1-chenhuacai@loongson.cn>
References: <20260626150605.3967536-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260626150605.3967536-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.2
X-PR-Tracked-Commit-Id: 262a3b4fa1792d40728c69995924e11cf761f5cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 51cb1aa1250c36269474b8b6ca6b6319e170f5a5
Message-Id: <178248874526.1001923.7273945879011565611.pr-tracker-bot@kernel.org>
Date: Fri, 26 Jun 2026 15:45:45 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 26 Jun 2026 23:06:04 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/51cb1aa1250c36269474b8b6ca6b6319e170f5a5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
