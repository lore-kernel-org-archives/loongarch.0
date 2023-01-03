Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D602F8466
	for <loongarch@lists.linux.dev>; Tue,  3 Jan 2023 15:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 796F4C433D2;
	Tue,  3 Jan 2023 15:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672761017;
	bh=f0fQTmiIay/WtctHZda1jjvXhFgwVvEcZYZA9R+/WqA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZCMe0K1i4SUHlAW0gSGU0UMJZfTavFHkdX+SwbaLnDmfSvVA/kxP0BrrsDSS38rXd
	 lfovnXtXBnme1shYK0iGYZVsDtU6EdQcB7Eeev4RImViku4eQGXzW45ykni3MR3rxn
	 ZTtkzrmXjLFSPtQcX1XtGOTD8g7z0x2YjD6b7OeVRTt2bnM78fzI5hF85bZDah/rx2
	 vm1xrvJtbLQsxU8KgqFcG7rnXr0mHJZZe8JIH6FIDm7Z7QdzS3XMiJv4FJHK1Zq0Fr
	 Gpbq0COL9sQkxTIcdGcT8s4aHekEWAgHD+k+RD5ES7A3N1FLFvJHi8aXnUlfyBk+bg
	 G6jbnaiMOfTXA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5F760E5724D;
	Tue,  3 Jan 2023 15:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next] libbpf: Add LoongArch support to bpf_tracing.h
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <167276101738.20921.8564438436207074197.git-patchwork-notify@kernel.org>
Date: Tue, 03 Jan 2023 15:50:17 +0000
References: <20221231100757.3177034-1-hengqi.chen@gmail.com>
In-Reply-To: <20221231100757.3177034-1-hengqi.chen@gmail.com>
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: bpf@vger.kernel.org, loongarch@lists.linux.dev, andrii@kernel.org

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Sat, 31 Dec 2022 18:07:57 +0800 you wrote:
> Add PT_REGS macros for LoongArch ([0]).
> 
>   [0]: https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF-ABI-EN.html
> 
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  tools/lib/bpf/bpf_tracing.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> [...]

Here is the summary with links:
  - [bpf-next] libbpf: Add LoongArch support to bpf_tracing.h
    https://git.kernel.org/bpf/bpf-next/c/00883922ab40

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


