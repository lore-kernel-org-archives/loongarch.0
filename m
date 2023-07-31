Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28A68BEE
	for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 16:39:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5C6F92B0;
	Mon, 31 Jul 2023 16:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5C6F92B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1690821075; bh=WuhGN+0w12HzEnIjIyqr3pVITUuBo6hhUZepmI9V0I4=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=F4xaU+0GfW9MY8ozX0wGQOiP60L0TdKARqQ38plJBvqkJQhrIpZfZ3Wt40ySFvciR
	 zTasFRcmCw3DPBwPgF598lm5UpFGFiWGvTtmiGubF26NtL6qKleYe3aKzsHEGy/aHa
	 4jWQulSZl/89wXLqRbaajJ70FSVcgL2fo6fAcnc1uxaiLMIkoJW5IcFLd03FJ9VEvs
	 WeBa4hVullBOXc0pgzlCmPyO70m9oJzMb2LM/bV2hn0TGsLN5+fkNonY3bbcSzKF/W
	 FS2Po45yZjlS8r9G6mcCQa88DNZoWT0aLgalLooVqEC2EekBCEquAu1Ip1K8rUEbpM
	 pH/ou6e6BgTCg==
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Thomas Gleixner
 <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Vineet Gupta
 <vgupta@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Costa
 Shulyupin <costa.shul@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Wu XiangCheng <bobwxc@email.cn>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:LOONGARCH" <loongarch@lists.linux.dev>
Subject: Re: [PATCH v3] docs: move loongarch under arch
In-Reply-To: <20230717192456.453124-1-costa.shul@redhat.com>
References: <87edl6wr9p.fsf@meer.lwn.net>
 <20230717192456.453124-1-costa.shul@redhat.com>
Date: Mon, 31 Jul 2023 10:31:14 -0600
Message-ID: <87tttkcab1.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Costa Shulyupin <costa.shul@redhat.com> writes:

> and fix all in-tree references.
>
> Architecture-specific documentation is being moved into Documentation/arch/
> as a way of cleaning up the top-level documentation directory and making
> the docs hierarchy more closely match the source hierarchy.
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
>
> ---
>
> Changes:
> v3: fixed typo in drivers/irqchip/Kconfig
> v2: added fix of MAINTAINERS and drivers/irqchip/Kconfig
>
> I'll continue with the rest architectures.
> Thank you.
> ---

Applied, thanks.

jon
