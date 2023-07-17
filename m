Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BABFBA33
	for <loongarch@lists.linux.dev>; Mon, 17 Jul 2023 14:23:48 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8FD625BF;
	Mon, 17 Jul 2023 14:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8FD625BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1689603827; bh=wC/sqgz5xsdanwszDeKUfk2KUzM+XO1KRTq8or0Db40=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Bl8Il627ZcL2pgqxNJSJ5weZgg63d7bpOCCpoyEH7hyNtkgCmA4pNoRSp+FkuHcJI
	 NXC+cmfhwRX3Dd/akOavmziEVFbzPSgQJmuGaPfyodxDYto7NoZYrO/gz+DbDdg18g
	 KxDp7WGa+vpXRXqecKZB57bOd94yqviAdZv3mVLNtYhCsJK3KULFbi9jpzpg0O4ezw
	 wydqrCwtw7R0N3NK/v0sKWg1XuRHL2drH4pJ1nx/qwXsxjBJYOl4JH6PCU33KEwxjJ
	 ro8WtFs1ugalAW+bJq4zF6F6XalUvX4Btq9L6WWW8JkX+dc9cHLuVg9ZELyWqA7fXp
	 SRFRpARM0PBCg==
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Thomas Gleixner
 <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Costa Shulyupin
 <costa.shul@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, Tiezhu Yang
 <yangtiezhu@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, Wu
 XiangCheng <bobwxc@email.cn>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:LOONGARCH" <loongarch@lists.linux.dev>
Subject: Re: [PATCH v2] docs: move loongarch under arch
In-Reply-To: <20230717141345.431342-1-costa.shul@redhat.com>
References: <87mszuwt4r.fsf@meer.lwn.net>
 <20230717141345.431342-1-costa.shul@redhat.com>
Date: Mon, 17 Jul 2023 08:23:46 -0600
Message-ID: <87edl6wr9p.fsf@meer.lwn.net>
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
> ---
>
> Changes:
> - added fix of MAINTAINERS and drivers/irqchip/Kconfig 

Um ....

> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 4b9036c6d45b..5e54032f07c6 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -567,7 +567,7 @@ config IRQ_LOONGARCH_CPU
>  	help
>  	  Support for the LoongArch CPU Interrupt Controller. For details of
>  	  irq chip hierarchy on LoongArch platforms please read the document
> -	  Documentation/loongarch/irq-chip-model.rst.
> +	  Documentation/arch/oongarch/irq-chip-model.rst.

Can you please try to be a bit more careful than that?

Thanks,

jon
