Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863C333C5
	for <loongarch@lists.linux.dev>; Sat, 13 Apr 2024 07:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712992817; cv=none; b=JehQeNaolqjv/KCgU0mVMOJzms7MmWX2TzySKuvuol66y4gdGk0jW+L+zMFf/esEE1BBIKSOV2yLw9/qsDZvDE3Q7PN+cXRnTGxOnOTOcUyQiSKTVirtqQMBSyM2IeA41Pi245YLN+tWcTxjrJJI6gef8vxr1nhZb5NBCugYhCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712992817; c=relaxed/simple;
	bh=d2vrdaAMOxUHT03MsI/qG199mkEC0umiyWDoR59Vpqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eHZEB+VaJqnAw4pnFbMw2PfE+Qh1CTRsmCNJy7+WgWZKiqSGfJK5kVOfxA9R0aX8F3hPwfFI5BOMUB7qCId5r3f28FDWOs+GIl0ZjH745KadUNq+3QsqH5plV5OifCBNXFbofN9Ehus2iAk8VB5LOfagwwVjtVPI6t2mq6faC4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPX02MGZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPX02MGZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E0AC113CE
	for <loongarch@lists.linux.dev>; Sat, 13 Apr 2024 07:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712992817;
	bh=d2vrdaAMOxUHT03MsI/qG199mkEC0umiyWDoR59Vpqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HPX02MGZli3ugRnyb+46orHSV5+rMvEDUYWMPhbLMFtua/xuzLvT1nvl6VXCsJGQ1
	 3HpfIazlTdJI4kvD/NOB8US3HkyGVYVl6FoL+5PHRqpj5cRyg5za/zgG5+s+w9Yb/A
	 0AOm2eRj/IYxwY6hNc+zhCTLAaLIxoBWVOIIBpK134ms74W93DWpxT6l7yh2Ji7oSo
	 FRgbozAB2tG9gnT0sHm1zD5JNpp9VsyLq/VTtw/AHUrQ8napQBm/bmmgcQAzlNvQI2
	 BeoHj9p1fXYc3joC40ajPnvGUCzQtEvRBDFyGQtXH81HFHGvhYes0gHHtV4pbir62R
	 WbcNTCAp4ZcRQ==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a5200202c1bso182238566b.0
        for <loongarch@lists.linux.dev>; Sat, 13 Apr 2024 00:20:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXyK2PYTdK+DLlJ7ties9OcCgTNY9lUvW8fi9XFWe6++tbeUBghExkLRFQLZJ8ds1HNZyk1lug4Nt0SpXPkfUXMrgU1wrlHAgdP
X-Gm-Message-State: AOJu0YzbqY8F5hI/vkPMOPmF7zDyt4aimnQVA6pG6DFY8x01YyDNdidl
	ayjh8KZ/yeBU/oVx3soQ8m/pin84HJnmab0EjD6suPLXT+VLsmRUIj4+gqHaCvFOhUg9hyjvBiO
	V/5cJLQNMfibmrdGLvL7U7dgFCX0=
X-Google-Smtp-Source: AGHT+IGUdg+yflZVA+Cnlxs0ixSMlXPzEoOhYaWUXSxWsW+jPNeK3NqglOUYCLrDtLgAdsV5vK6zLRUWHI4Ih0ePLaY=
X-Received: by 2002:a17:906:c116:b0:a52:35d2:2e72 with SMTP id
 do22-20020a170906c11600b00a5235d22e72mr3806469ejc.68.1712992815699; Sat, 13
 Apr 2024 00:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411010510.22135-1-yangtiezhu@loongson.cn>
 <20240411010510.22135-2-yangtiezhu@loongson.cn> <CAAhV-H6TVEEB=xdr_ymuUnDqPDXwtM7R7yJBj03YhWpCwqjAiA@mail.gmail.com>
 <dcf6e475-8219-6b1e-a99b-2cdf1e86289c@loongson.cn>
In-Reply-To: <dcf6e475-8219-6b1e-a99b-2cdf1e86289c@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 13 Apr 2024 15:20:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7AUxqecu7f=TmdteBG6biudDGk2T+wkZvboMdVw=8ScQ@mail.gmail.com>
Message-ID: <CAAhV-H7AUxqecu7f=TmdteBG6biudDGk2T+wkZvboMdVw=8ScQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] LoongArch: Move CONFIG_HAVE_SETUP_PER_CPU_AREA
 related code to smp.c
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 5:27=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
>
>
> On 04/12/2024 12:12 PM, Huacai Chen wrote:
> > On Thu, Apr 11, 2024 at 9:05=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> >>
> >> Currently, if CONFIG_NUMA is not set but CONFIG_SMP is set, the arch
> >> specified setup_per_cpu_areas() in arch/loongarch/kernel/numa.c will
> >> not be built and the generic setup_per_cpu_areas() in mm/percpu.c is
> >> actually used, this is not reasonable and does not work as intended.
> > Why is the generic version not reasonable? We need a custom version
> > just because it can put the percpu variable in the best node. If NUMA
> > disabled, software can only see one node, how to optimize?
>
> The initial aim is to use the arch specific setup_per_cpu_areas()
> in any case under CONFIG_SMP, this patch can be dropped if it is
> meaningless for the case of !CONFIG_NUMA and CONFIG_SMP.
Yes, it is better to drop this patch.

Huacai
>
> Thanks,
> Tiezhu
>
>
