Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280758F7D
	for <loongarch@lists.linux.dev>; Mon, 17 Jul 2023 13:43:40 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B295D2C0;
	Mon, 17 Jul 2023 13:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B295D2C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1689601413; bh=gfGH++kob3AOtPuAhETDkE/EY5vmMzF/KJo8XLPMBOY=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=TPXYhG6wvQWdMlwPpPl4WZZj/NCAvmxHnvo4v6fkU6F3FPLqFIEHsVNAK899SxU2u
	 Vtec5DiUh+AvPnup2ZH8ktLGVuKBOk9CZqraBGvB+sqR7F9FV7Mgp3ee4zi2KH870x
	 7K/avmcyrsekvjZeAhvP9khbrzgVCDvCMdlFp/FNr590cmvpQcPbqBL4wXClBkRVjt
	 Pbpl9390rxKymOA1UCNL7bcarBLzeuyB8DMGS9JpdiXxWmiPDF/E1yw0kL9/VUcySg
	 omRbAh12twH+dIJERoYFxuuiBWQffe3Pgac3q8/u3nDYfya1Lv3NSGKH0c2fU0Vggz
	 ZTy9eJ7uB33pw==
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Alexandre TORGUE
 <alexandre.torgue@foss.st.com>, Max Filippov <jcmvbkbc@gmail.com>, Costa
 Shulyupin <costa.shul@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Wu XiangCheng <bobwxc@email.cn>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:LOONGARCH" <loongarch@lists.linux.dev>
Subject: Re: [PATCH] docs: move loongarch under arch
In-Reply-To: <20230717070643.313689-1-costa.shul@redhat.com>
References: <20230717070643.313689-1-costa.shul@redhat.com>
Date: Mon, 17 Jul 2023 07:43:32 -0600
Message-ID: <87mszuwt4r.fsf@meer.lwn.net>
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
>  Documentation/arch/index.rst                                  | 2 +-
>  Documentation/{ => arch}/loongarch/booting.rst                | 0
>  Documentation/{ => arch}/loongarch/features.rst               | 0
>  Documentation/{ => arch}/loongarch/index.rst                  | 0
>  Documentation/{ => arch}/loongarch/introduction.rst           | 0
>  Documentation/{ => arch}/loongarch/irq-chip-model.rst         | 0
>  Documentation/translations/zh_CN/arch/index.rst               | 2 +-
>  .../translations/zh_CN/{ => arch}/loongarch/booting.rst       | 4 ++--
>  .../translations/zh_CN/{ => arch}/loongarch/features.rst      | 4 ++--
>  .../translations/zh_CN/{ => arch}/loongarch/index.rst         | 4 ++--
>  .../translations/zh_CN/{ => arch}/loongarch/introduction.rst  | 4 ++--
>  .../zh_CN/{ => arch}/loongarch/irq-chip-model.rst             | 4 ++--
>  12 files changed, 12 insertions(+), 12 deletions(-)
>  rename Documentation/{ => arch}/loongarch/booting.rst (100%)
>  rename Documentation/{ => arch}/loongarch/features.rst (100%)
>  rename Documentation/{ => arch}/loongarch/index.rst (100%)
>  rename Documentation/{ => arch}/loongarch/introduction.rst (100%)
>  rename Documentation/{ => arch}/loongarch/irq-chip-model.rst (100%)
>  rename Documentation/translations/zh_CN/{ => arch}/loongarch/booting.rst (94%)
>  rename Documentation/translations/zh_CN/{ => arch}/loongarch/features.rst (61%)
>  rename Documentation/translations/zh_CN/{ => arch}/loongarch/index.rst (78%)
>  rename Documentation/translations/zh_CN/{ => arch}/loongarch/introduction.rst (99%)
>  rename Documentation/translations/zh_CN/{ => arch}/loongarch/irq-chip-model.rst (98%)

A couple of things:

- I'm slowly working in this area...indeed, I have a loongarch move
  already done, I just haven't posted it yet.  So please talk to me if
  you want to do more of these.

- If you do a move like this, you need to fix up the collateral damage.
  There are references to Documentation/loongarch in MAINTAINERS and
  drivers/irqchip/Kconfig that need to be fixed as well.

Thanks,

jon
