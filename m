Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E62390606
	for <loongarch@lists.linux.dev>; Wed, 13 May 2026 02:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778640662; cv=none; b=ZlB4nMVjdBBGflj1h+3qlj7EcpC1wd2fy4C4kzvsgcODdU+7ftiLuTeotqLACoICtueLUzm+eyGsMqL2JToE4opE5GvaTzAOu5L5HgRakKIFrrgnwv1b5AkMn47V8f7fVB9+6Yiv47dGIUSU3w49e2s8Fwg9nxE7VgQsUC7evWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778640662; c=relaxed/simple;
	bh=v2mU9pcRkd3MQAYUtl6kuKwY5FgsCXLxZAHRaLrUwsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYKCkhgMstm29KcLkK9TTZ6a6pBraTr9uK4jRM24N7keZJLXvt6P1NkIl88sr7+HUYsuoUo5FuhQEyfV6KBwfCkTDyMgKnyCEZXqTPva7QIGOZ72+0wfwSEyb7uBeQL7emtDcyUXo45UL35JgiAjzj/0fpFB1pfDfC+CXeNoOpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tps1EE9t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tps1EE9t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97F9C2BCF7
	for <loongarch@lists.linux.dev>; Wed, 13 May 2026 02:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778640661;
	bh=v2mU9pcRkd3MQAYUtl6kuKwY5FgsCXLxZAHRaLrUwsc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tps1EE9teq5f+yMI1TdYPc168YCveDPtjZ3JqJuJV9omhW3aFHyKkCGSdhD2qwfVL
	 iFaJDXNsVgvdU03dBDaPogbrCS2UAoa6LCs8+dWqtn0shRJSX3Z2ct5Y/y36nvNPb4
	 hc4UzE0V83kPqNBuXP+vxxGLO6+9iF6zd7A2MIzVSCjieEpr+MEmuswCePK3bT7fbb
	 fJlGchWVaezV1Xt3QHS6O/HKYnuOlZuHP6SuZ+sKQ0RhlvQ8XY2Fm0y2cbw5TOfQ7J
	 /EWjhfzqdJPWXIVepVJxgugP/69PPMNzf3mzEe6yPVMNk9XIh7E/T2MJa/0e0MvUBD
	 M/UI/RcRpge7g==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bd21ffaca79so324341766b.0
        for <loongarch@lists.linux.dev>; Tue, 12 May 2026 19:51:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+wtaD3FpqxjGXtMhJ8OCn9lDgdeq4SjYOpTwWPVucbvXvfYFQ6tih6rG3ujgCZ/5K8F7Msge+ZG6Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFFELPa2jgeTlzuwaYSGI1Q2wDIXeQE82nCLS3fKarpKqtyuM0
	lg58mxy98BuSRaZ3lzAkNVfnBZFUhXcZqUCosCB+fGWfmrBs83ZuIK1cyu0Ko0oVWe5oYfw7S7u
	gtNOYTnt1P1Ov7I5Fev8MF9As54zA60w=
X-Received: by 2002:a17:906:eec7:b0:bd2:1e8d:a13e with SMTP id
 a640c23a62f3a-bd3add39e3cmr80624066b.11.1778640660153; Tue, 12 May 2026
 19:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513012839.2856463-1-zhangtianyang@loongson.cn>
In-Reply-To: <20260513012839.2856463-1-zhangtianyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 13 May 2026 10:50:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6qd-frORWPV=AQ7xWNk7mSrgSaNZdtyFYwaE8bw8gCqg@mail.gmail.com>
X-Gm-Features: AVHnY4JCSs4WmAsNKyoczwB5bn83orpmngI4EhKlHUK3WaRo0G-5sHS0VnT8E98
Message-ID: <CAAhV-H6qd-frORWPV=AQ7xWNk7mSrgSaNZdtyFYwaE8bw8gCqg@mail.gmail.com>
Subject: Re: [PATCH v12 0/4] Loongarch irq-redirect support
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev, 
	tglx@linutronix.de, jiaxun.yang@flygoat.com, maobibo@loongson.cn, 
	loongarch@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 9:29=E2=80=AFAM Tianyang Zhang
<zhangtianyang@loongson.cn> wrote:
>
> This series of patches introduces support for interrupt-redirect
> controllers, and this hardware feature will be supported on 3C6000
> for the first time
For the whole series:
Acked-by: Huacai Chen <chenhuacai@loongson.cn>

>
> change log:
>         v0->v1:
>         1.Rename the model names in the document.
>         2.Adjust the code format.
>         3.Remove architecture - specific prefixes.
>         4.Refactor the initialization logic, and IR driver no longer set
>           AVEC_ENABLE.
>         5.Enhance compatibility under certain configurations.
>
>         v1->v2:
>         1.Fixed an erroneous enabling issue.
>
>         v2->v3
>         1.Replace smp_call with address mapping to access registers
>         2.Fix some code style issues
>
>         v3->v4
>         1.Provide reasonable comments on the modifications made to
>           IRQ_SET_MASK_OK_DONE
>         2.Replace meaningless empty functions with parent_mask/unmask/ack
>         3.Added and indeed released resources
>         4.Added judgment for data structure initialization completion to
>           avoid duplicate creation during cpuhotplug
>         5.Fixed the code style and some unnecessary troubles
>
>         v4->v5
>         1.when it is detected in avecintc_set_affinity that the current a=
ffinity
>         remains valid, the return value is modified to IRQ_SET_MASK_OK_DO=
NE.
>           After the introduction of redirect-domain, for each interrupt s=
ource,
>         avecintc-domain only provides the CPU/interrupt vector, while red=
irect-domain
>         provides other operations to synchronize interrupt affinity infor=
mation
>         among multiple cores.     The original intention is to notify the=
 cascaded
>         redirect_set_affinity that multi-core synchronization is not requ=
ired.
>           However, this introduces some compatibility issues, such as the=
 new return
>         value causing msi_domain_set_affinity to no longer perform irq_ch=
ip_write_msi_msg.
>           1) When redirect exist in the system, the msi msg_address and m=
sg_data no
>         longer changes after the allocation phase, so it does not actuall=
y require updating
>         the MSI message info.
>           2) When only avecintc exists in the system, the irq_domain_acti=
vate_irq
>         interface will be responsible for the initial configuration of th=
e MSI message,
>         which is unconditional. After that, if unnecessary, no modificati=
on to the MSI
>         message is alse correctly.
>
>         2.Restructured the macro definitions to make them appear more log=
ical.
>
>         3.Adjusted the layout of members struct redirect_queue\struct red=
irect_table and
>         struct redirect_item, making redirect_item the primary interface =
for accessing
>         other members.
>
>         4.The method of accessing registers has been standardized to MMIO=
.
>
>         5.Initialize variables at declaration whenever possible.
>
>         6.Replaced the the "struct page" in redirect_table and redirect_q=
ueue with "struct folio".
>
>         7.Adjusted the initialization process so that all irq_desc config=
urations are completed
>         during driver initialization, no longer relying on specific CPUs =
being online.
>
>         8.Refactored portions of the code to make them more concise and l=
ogical.
>
>         v5->v6
>         Fix the warning messages reported by the test bot.
>
>         v6->v7:
>         1 Split patch:
>          1) Docs/LoongArch: Add Advanced Extended-Redirect IRQ model desc=
ription
>          2) LoongArch: Architectural preparation for Redirect irqchip
>          3) irqchip/irq-loongson.h:irq-loongson.h preparation for Redirec=
t irqchip
>          4) irqchip/loongarch-avec.c:return IRQ_SET_MASK_OK_DONE when kee=
p affinity
>          5) irqchip/irq-loongarch-ir:Add Redirect irqchip support
>
>         2 Use sizeof() to replace fixed-size macro definitions.
>
>         3 Unify the data types of the parameters for redirect_write/read_=
reg*.
>
>         4 rename irde_invalid_entry_node to irde_invalid_entry and add co=
mments
>           explaining the 'raddr'.
>
>         5 Fix the critical condition check bug in redirect_table_alloc.
>
>         6 Use clear_bit to replace bitmap_release_region
>
>         7 Delete some goto and handle the failure when it occurs.
>
>         8 Removed the check for the `CONFIG_ACPI` macro, as CONFIG_ACPI
>           is selected by the arch/loongarch/Kconfig.
>
>         9 Fixed the incorrect error flow in redirect_acpi_init.
>
>         v7->v8:
>         1 Apologies for the chaotic email delivery due to some network is=
sues earlier.
>
>         2 redirect_table_alloc now allocates nr_irqs consecutive redirect=
 table entries to
>           support multiple MSI devices.
>
>         v8->v9:
>         1 Rebased and reorganized the patches on the latest irq/core bran=
ch.
>
>         v9->v10
>         1 Rewrite the changelog in the order of background, problem and s=
olution.
>         2 Fix the potential undefined issue with 'order' in the redirect_=
table_alloc.
>         3 Use GPL-2.0-only as SPDX-License-Identifier.
>         4 Update the code creation time.
>         5 Rearrange the order of the header files alphabetically.
>         6 Refactor portions of the code and remove unnecessary line break=
s.
>         7 Rename __redirect_irde_fini() to redirect_free_irde() and label=
 it with __init.
>
>         v10->v11
>         1 Adjust the name of patch 0002.
>         2 Simplify some code.
>         3 Fix the incorrect data type.
>
>         v11->v12
>         1 Adjust the description of the interrupt model in the documentat=
ion
>           to better reflect the actual situation.
>         2 Modified some inappropriate commit messages.
>         3 Adjusted part of the code to better conform to specifications.
>
> Tianyang Zhang (4):
>   Docs/LoongArch: Add advanced extended IRQ model (redirection)
>     description
>   irqchip/loongarch-avec: Prepare for interrupt redirection support
>   irqchip/loongarch-avec: Return IRQ_SET_MASK_OK_DONE when keep affinity
>   irqchip/loongarch-ir: Add IR (interrupt redirection) irqchip support
>
>  .../arch/loongarch/irq-chip-model.rst         |  35 ++
>  .../zh_CN/arch/loongarch/irq-chip-model.rst   |  34 ++
>  drivers/irqchip/Makefile                      |   2 +-
>  drivers/irqchip/irq-loongarch-avec.c          |  20 +-
>  drivers/irqchip/irq-loongarch-ir.c            | 537 ++++++++++++++++++
>  drivers/irqchip/irq-loongson.h                |  15 +
>  6 files changed, 629 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/irqchip/irq-loongarch-ir.c
>
> --
> 2.20.1
>
