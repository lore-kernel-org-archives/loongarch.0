Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5B72F28EA;
	Wed,  6 May 2026 14:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078690; cv=none; b=sbplFTpj0PgbuyJPT8eX9CeBBdN5RFVPuR80Ja9fzp4mug2wW3qlYK9pVSiBKkLmeaj3XsKETvlfYpeyQY6jWY1/6omn6iqpjkha5N8jOfVEubiVCPMtSJpo9ctjPguMIPEi2tV7ggKIdZytQbOtbRGji2Wji544p9/Qo/AVBCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078690; c=relaxed/simple;
	bh=HqWNgmMyA8Pg0sdOjhDt13Vza/SUVufhK1eqksB57HA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YPEomkMYlHNkP0yPfSIQpFgQTF/3WlgNVz8od85u6CuE0vlFit7wjFf6I7nii139hl9L0os2ba4I/LcpIb+kjY1WN0mDEy3ohSDdaEmEmIExCgKrraINj1JxdaSIYXsK+44Cn/3e+KYYdWabQ+YynQ2qiXu16ynRnXrEOhwBfXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfyrZZjq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfyrZZjq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF04C2BCB0;
	Wed,  6 May 2026 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778078689;
	bh=HqWNgmMyA8Pg0sdOjhDt13Vza/SUVufhK1eqksB57HA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CfyrZZjqkNhF3/FioHaXCd3/cR+iuVN2FsWmNYkOfu3hBBCIqcyFNLcZs6eUQrKvD
	 29OQTcjRA8X+mCkzoxKaMTP1kg78iCVW2osVwHx9rA0VWARzrm9Vum4+thsxe0g8fk
	 rwjnV4zWyyTF+6ab2MIUsFIfbD5M4KJJaUtAgnR8iJ7YxTXYVLxIOQbINzHXOBroCU
	 jVKzSqejjqOqnmY7Ef9N1r6iAtXBajn0juOKVwb+WcwZV380xQQCLaTCa4YMXciniU
	 /ut+tJD6BfDXyBUCqvE9BdZpgGEPDB4N/s5ATWdVAMVa/hTj21BdmznEGffdQx8yoP
	 19N/bPlTalXqQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA1963930888;
	Wed,  6 May 2026 14:44:00 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v7.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260506023904.253139-1-chenhuacai@loongson.cn>
References: <20260506023904.253139-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260506023904.253139-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.1-1
X-PR-Tracked-Commit-Id: 5a873d77ba792410a796595a917be6a440f9b7d2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e80948062dcfff0543c5c60ba8654e825bf73b5a
Message-Id: <177807863933.3029139.16492814668719833617.pr-tracker-bot@kernel.org>
Date: Wed, 06 May 2026 14:43:59 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Wed,  6 May 2026 10:39:01 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.1-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e80948062dcfff0543c5c60ba8654e825bf73b5a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
