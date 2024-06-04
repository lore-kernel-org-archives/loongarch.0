Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8771846D
	for <loongarch@lists.linux.dev>; Tue,  4 Jun 2024 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717513038; cv=none; b=oVU/CMit3wTd0SBO5etdRenYcJu6Ptv1riX/Tr+qPHfvlhfjz3uesRZuvnBAipdluDFj5hBq4QeyjYGWwSTDEkRiytBnKxWLZBrqxsgk0Wr9ZSs4tstiNbojTxtxqA/a7+KbHnEe8zA5zB8SUE38gBV2XWWVZk/WKQWZzn8JQ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717513038; c=relaxed/simple;
	bh=Prc229CixKADL7r01Yfc9cHrwltTAJ/Gc5KJY4hP6nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIx0SHZhk2a1XJDEDVhfZPncB7LdBrH3DF/gBue6Rs7273Jj0T/IbDPI+U+ccCze60IwWzZRTA+tHM2mn+K7WdqFacfK0t57DpPMto6I68lYyzvYQQ6ZJfelb5sUCvMDx/4CwNCruDh6K25Zk4wwMXgUOmy6XswC8UhJW05c7WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPyubfwH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPyubfwH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1E2C32786
	for <loongarch@lists.linux.dev>; Tue,  4 Jun 2024 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717513038;
	bh=Prc229CixKADL7r01Yfc9cHrwltTAJ/Gc5KJY4hP6nk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GPyubfwHpOshcn9woxjTA8pVIYNzr4+MA9DsWohWeqJwxCj6CdeLb8/NCsc4+rU/z
	 pdN20XEWaCc8xT9sRgp/A0HLFVtZST/lrxsu/ZHPcssg1M2zT6a+Pxs7IFCecs60wJ
	 XyFojn91BfU0KOSqCwI2uzWiHmnjiejW67EjOdJ8zGx0c5jE7VqCECK4gMoxhBx36b
	 m3RYsdDF+JxeQBg6DADVw1/Gf9b0J2nmBKb9csG54LwMScMk7QbOUjSSl4w0tGCguG
	 LPGt3wzYVoXOodTE70wH01vU+0U8JtmqrYNOU7PFtTbin7DCFKrokcXcUmAdIHl45G
	 HypO0WzI0yjWQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57a20ccafc6so5233666a12.2
        for <loongarch@lists.linux.dev>; Tue, 04 Jun 2024 07:57:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxoT8F5uYykbuqSX0UnEbc7Z64ceX/Q/mb3byggj5ayV1yq1yKqjuplfJsDC+71PEW6kssFXuy/HY6AP4R03WUXp59rbk7IGgG
X-Gm-Message-State: AOJu0Yx1DAY35k3qKKFt6VFIBk69LEH2EZun9Xc0yRGk0Z5H5YGwcqQV
	0c7LFM74VjAHUDg3iN5rN4UOonxoRuqhnRARMI7Jb1cK3P1k5IBjQ3i6VVSCqNkaTJASChV3o3r
	+BGZQJI/Wn4e5DQvWvwQIa6EEKt8=
X-Google-Smtp-Source: AGHT+IFI8QP1aHzAaEgzn6Yxg5h6Mz9ZFEuDthtMFRKRH3AuaG3MxPpYeNODMvyHqxzRyF9UIP4Zso0m/Gr29N8anZY=
X-Received: by 2002:a17:906:37d2:b0:a68:c14d:2686 with SMTP id
 a640c23a62f3a-a68c14d26ccmr576013066b.25.1717513037225; Tue, 04 Jun 2024
 07:57:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240529111947.1549556-1-zhanghongchen@loongson.cn>
In-Reply-To: <20240529111947.1549556-1-zhanghongchen@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 4 Jun 2024 22:57:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5KD8BPzZYjpj5s4iSjOfJr+Q9hCV1nQn6fsUXPU8sriA@mail.gmail.com>
Message-ID: <CAAhV-H5KD8BPzZYjpj5s4iSjOfJr+Q9hCV1nQn6fsUXPU8sriA@mail.gmail.com>
Subject: Re: [PATCH] PCI: use local_pci_probe when best selected cpu is offline
To: Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Hongchen,

On Wed, May 29, 2024 at 7:19=E2=80=AFPM Hongchen Zhang
<zhanghongchen@loongson.cn> wrote:
The title should be better like this:
PCI: Use local_pci_probe() when best selected CPU is offline

>
> When the best selected cpu is offline, work_on_cpu will stuck
> forever. Therefore, in this case, we should call
> local_pci_probe instead of work_on_cpu.

It is better to reword like this:

When the best selected CPU is offline, work_on_cpu() will stuck forever.
This can be happen if a node is online while all its CPUs are offline
(we can use "maxcpus=3D1" without "nr_cpus=3D1" to reproduce it), Therefore=
,
in this case, we should call local_pci_probe() instead of work_on_cpu().

Huacai

>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
> ---
>  drivers/pci/pci-driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index af2996d0d17f..32a99828e6a3 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -386,7 +386,7 @@ static int pci_call_probe(struct pci_driver *drv, str=
uct pci_dev *dev,
>                 free_cpumask_var(wq_domain_mask);
>         }
>
> -       if (cpu < nr_cpu_ids)
> +       if ((cpu < nr_cpu_ids) && cpu_online(cpu))
>                 error =3D work_on_cpu(cpu, local_pci_probe, &ddi);
>         else
>                 error =3D local_pci_probe(&ddi);
> --
> 2.33.0
>
>
