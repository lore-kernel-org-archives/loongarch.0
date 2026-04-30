Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DEA3630BC;
	Thu, 30 Apr 2026 03:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519599; cv=none; b=AdKcai7NavM0nkb30OCN2te6sjEKYEHhH3w1n6EN9fnqEZC7R1aXLc06/Cd/xgdcMqlIVEtCmm8EVNh0yNWGBkAObf/FFTq1AmDrtYeTSRfkFXMp9Ve+GUXGTwQxx0h5G1qVB598K773Nt/8puP5SCBg/m8bAZtrqNuM1Y1onWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519599; c=relaxed/simple;
	bh=qiWsFnvghBXNIkuBScVpFgUN25eAK8sfKgLJRxbUuL4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BdM/9Cbh03EhuWJ0xkqTf8egh1tnT60pdcXuarcta0FlDice11rWPN/3PSq6fLlRNFRJtkmO1d2jHgoJidMujanN2YCmL6Dx+muSzktB029BNVmcKqaEZS8J2UEIq2JZWIZrdxwxFd4dg7YZQiq2F8OKJ8ZCkcNJRi2ww9+n1a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+rUA1Ca; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+rUA1Ca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35E4C2BCB8;
	Thu, 30 Apr 2026 03:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519599;
	bh=qiWsFnvghBXNIkuBScVpFgUN25eAK8sfKgLJRxbUuL4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N+rUA1CabGjbI7N7bttoPb3GmTGr0zK5YcDinIrMTNz8LOA/nYcKYZu90HcC73Jgc
	 h5YAbBJ2SR1TwRxmrSF0vJDo+hgHIG60Wz9pF4sYooMH6rXUFQUb/ETFocmoX44g6J
	 J+auvxIiTtEkAj3I9PqMraUpRRzWvNE6cLTFP6d0QxR5tApKvXaC/eTTMP9soVVQWB
	 hi6cbt2o+eRvnVzv1g/kLMClhFpgI3gJVp3YNYredvjmXgw2jf54NktRIVKw4yE5n1
	 Gv3W8Fise08cpOmQq3Q5g8ByL3SoK9YHL072fVWI8uuLZOjjliCnaEFrAfH3pSY7dK
	 4SOxrim9gnT4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D1F3809A07;
	Thu, 30 Apr 2026 03:25:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751955479.2274119.1708184854494774643.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:54 +0000
References: <20260227193030.272078-13-kas@kernel.org>
In-Reply-To: <20260227193030.272078-13-kas@kernel.org>
To: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 muchun.song@linux.dev, david@redhat.com, willy@infradead.org,
 usamaarif642@gmail.com, fvdl@google.com, osalvador@suse.de, rppt@kernel.org,
 vbabka@suse.cz, lorenzo.stoakes@oracle.com, ziy@nvidia.com, bhe@redhat.com,
 mhocko@suse.com, hannes@cmpxchg.org, corbet@lwn.net, chenhuacai@kernel.org,
 kernel@xen0n.name, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kernel-team@meta.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, david@kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 27 Feb 2026 19:30:14 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> With fake head pages eliminated in the previous commit, remove the
> supporting infrastructure:
> 
>   - page_fixed_fake_head(): no longer needed to detect fake heads;
>   - page_is_fake_head(): no longer needed;
>   - page_count_writable(): no longer needed for RCU protection;
>   - RCU read_lock in page_ref_add_unless(): no longer needed;
> 
> [...]

Here is the summary with links:
  - [PATCHv7,13/18] mm: Drop fake head checks
    https://git.kernel.org/riscv/c/32c440d67e6c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


