Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0445F48C402;
	Thu, 20 Aug 2026 21:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787263058; cv=none; b=IIrb8Tqw7MusPCb3BC1jzGUo+nkB2vY+W6BQw4uYRaWw/rYAUlmr/PY9AWUjda82x/WAEGt2OqF+p4YQNDZyNgpDl1weJtrUYcOrG9eXPLRscyZsY85eJOtebbrRtqu6mbKeX8buCYAaKjVTKGdgEwi2pgdWzy1MtlhEdiRE6Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787263058; c=relaxed/simple;
	bh=o0wAcx9+TQilbfhrgGUKMQaYsHuhZdz6qeMXGMRiqhg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=XDQtgZj0q+TYEauF7Xn6ZDXJnGt8i8O9wf1CcnS33DE3dvz5hnj+Kf273O2EIreOIBWpNC4Y+0+LVbIgXrt2kyGtIE+24kgYFGKW6g7P4kvnNvCg0t7aD6U+flmDNx9eEdRpITf9loy14fFoXDm5G5F6b3qtVx4ak+l/z/6+IlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+ew2OFL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+ew2OFL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CAA1F00A3E;
	Thu, 20 Aug 2026 21:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787263051;
	bh=UoBej1dPnDo5ZA9pF+iSfFQ7696HN+Hl2uXYds6OpGk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=B+ew2OFLlqw38uC1t40F0IplH+yxNE0v/MAbPqyxQ0Gh1vp68XGbmXMnZ966bG7KK
	 GAjWjCeeAmagGKTET9N2n2yoo3ncj3iomVddZ1cG59qlQqXmkmHyC7uQRUoX5+LT4z
	 0+gWLb/mN0w4WBH5v5sLiuac0FH7zxUhs+gxvvjeH42CjwWdZmvSYUBdNQDNwQaPOo
	 CBI/eFgmPAmQ07A8gxO/ILMbo5j/IaIYiR1z6XBi0z+0jZ1kOD4teJSmUi03mImZwQ
	 7/Iggo1gJWM8vgTVBWA4qBfI2uYr4F20/uMARu7XL2FJgayAb5q3XvcXTm08dzpb/9
	 1hIYC4CJBzAsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19A303924472;
	Thu, 20 Aug 2026 21:56:43 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch changes for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260819065126.3734859-1-chenhuacai@loongson.cn>
References: <20260819065126.3734859-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <loongarch.lists.linux.dev>
X-PR-Tracked-Message-Id: <20260819065126.3734859-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.3
X-PR-Tracked-Commit-Id: 6afb03599653619e661121628611f808de1f7c7a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: caf325ab81be0bc22adf75248ecd22f52f01ad21
Message-Id: <178726300163.508102.1492553633980977288.pr-tracker-bot@kernel.org>
Date: Thu, 20 Aug 2026 21:56:41 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The pull request you sent on Wed, 19 Aug 2026 14:51:26 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/caf325ab81be0bc22adf75248ecd22f52f01ad21

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
