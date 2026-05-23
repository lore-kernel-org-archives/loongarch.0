Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B2A31B130;
	Sat, 23 May 2026 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779553423; cv=none; b=d1C6DX1/RSOcYDhy4hEUaXfePZeW5ph+DEprhhkdBvX2QdJGxqM/Ad/3bEJfJjLLzsOGL91v0jh1L6NrMLDTq5T8ntZ3gNehwivr6AjVRVEr5b59y/nlmRbvr2ZJiLELh7Bp9y1jtATrcjoWfpmlAmDe4mwsiD05tT1+yFdlRfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779553423; c=relaxed/simple;
	bh=qQtQcmjwJYM31qaZCAAzUF0s58nO7dm3ePezgqsSw94=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HpqolctrtcUw78VDE+8qlDj2hwVYxf6R+9qhV5AEsdCOMugp2bp/QIA2TGMRmQa7/NRI/xLkmEkfKgdjmCTePwjtCdFm5yN6eXLriORmSnCmrLRDW4RcVzGYEoVpTDcn7uJ+F9MIRzJF3V0peV8/BQjsS/giSNfo7UTRLwCJSCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQYuc+4n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQYuc+4n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E711F00A3A;
	Sat, 23 May 2026 16:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779553422;
	bh=lWe8oPEYTfW0y31/YJhks3lEeUrHI+1u8lC2rxAfkU4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=lQYuc+4nOcq5v6j8T1QPAlQA5EgiE6eM3iglcDXCQbL1TnZGcdB7UoMOh67OyBYbO
	 D+tYEdZebSPCiiGhqY6AyHTFx/v2MTKbSpzgVWip7Nz4ianVbIcVIRKwd5kTLQS6uf
	 tlHR3KhP2Dw8QPUSnIl/OaIEHv2qOwKwvrQRUvgkQnnvOK/MMyqGOYbyhP4k1rIaqR
	 Kb3mL2bYsKuQKgh8gItSfedPjF2nXZsQE0Ihwj7CVZjHcQEOS868vOkGyow9I7HuoY
	 1YhbXEXjI517Rmo4PupJNFNReFWzsC0f9OqYi8EhcLxlQbQjsXzQEPvedPbmwsyqUd
	 Y0MXuYIrLelZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93BB73808205;
	Sat, 23 May 2026 16:23:51 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v7.1-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260523072501.437301-1-chenhuacai@loongson.cn>
References: <20260523072501.437301-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <loongarch.lists.linux.dev>
X-PR-Tracked-Message-Id: <20260523072501.437301-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.1-2
X-PR-Tracked-Commit-Id: 4a09f4a23a3003d31f8545dd0770f2b3b0f54d8b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95e6d3ba0571330df866911da9dedd83e05417ca
Message-Id: <177955343015.1611769.12881375851148082291.pr-tracker-bot@kernel.org>
Date: Sat, 23 May 2026 16:23:50 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 23 May 2026 15:25:01 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-7.1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95e6d3ba0571330df866911da9dedd83e05417ca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
