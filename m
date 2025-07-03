Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE4613A258;
	Thu,  3 Jul 2025 02:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508462; cv=none; b=M4fGFrprOIW59ZYpT9l2Apny84JrtDNDkqRCoE1iKJ6G+FndDgq9sHaB7OIKSizwuSEa0RVprkBvAqjZKOUHiUpPQM4mNZaZMUEX7i43v0UortO29nqJZzCtkNsZ9duSEGpzYJJvd+uFor6ttuHeMk0FuM5TLOS+9/itU6HhXw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508462; c=relaxed/simple;
	bh=24G3epBX1KBvYzJEf8cy04InC7gA20oodLz2dmjVIc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFeaYznc9PK2q12mgn99l7OZKRu/JdxC6UXLU+Xq+N/DgVxqjhLCPtOIN8sGZUi4kkt+5bfmNqPSrEC7IN+6F7iAlFRkLFpP78tp/DwDJybnvFJNLiCWbDk8xePe7UrYXnNbTMpJnQKSUjyCMx7zKWxvm16bRvGTfeHyUnjlsnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2J4ujdR; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2J4ujdR"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so836571a12.0;
        Wed, 02 Jul 2025 19:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751508459; x=1752113259; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzkypJTa2aDOnGhEUSNksvIYvW5r2jEVvJtvSkexsCs=;
        b=S2J4ujdRG81IqmSbnVSz7P+rhftjwHCxZB3Ok7k/Y9pcU3HGocv475GEuyBG7EwYVY
         egI4XD6o/sANoGrofRUQs3wddtP9qd4EF0s15qIOeXGfDGNch0LW85YPgiyqBoyT48bE
         qH0uDTfxStT4lcVF6Nxn/ye5Da/QIxPD1Q/g1/B2FasD2xPU9NUNotw3Ab5Oq+Gug+jR
         2VOpFNvyTxMgzWqmJYIsZ8rUMY7dUfgGXqEun2ts2vWXLSQFc6J8WsDT3qobDxajr3pH
         Sc/jraSPcqVGvqiytnhHwSCVXc4gowuyqYHB9srgFrApU6ERz3tB8XeTDufHybcB5LER
         DjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751508459; x=1752113259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzkypJTa2aDOnGhEUSNksvIYvW5r2jEVvJtvSkexsCs=;
        b=B1FUuh6h9h8FFfPsPAPtXkJYp0uOsA4Kpg38HvNl5oRa2/tQiaX4xczW9XTWKGlDY4
         2mhXYu8LVSGp/VSHYS3MUTPFDW9+CD452axXhOGO5KFnlkHejZLgy5MoCZ3xzsMJWni9
         SS9rgZKBlxLw2OxeEtoOuUqN18NHVAEkrez1/fg5k0FhkLm8LN11MZW7Q+BxAJncD7eW
         zZMiof5ZbRchTzUmMoiwYEbbTF+dkU2xPWlm+JcBwBtvfTbszYIBjwwHFqsbiftdji9c
         Cc+T5kRVUywYoI2v5MLavchlQ2s9yoS03Km/RZIu5feaf48H6M7a/8tJgQRnytpco1YQ
         B6PA==
X-Forwarded-Encrypted: i=1; AJvYcCVFIBd688Y8YvEgbbpgtOWxyo+qxWHKNBdCgtpOofbwF+MBW/AGDs6uFIQj0b1VF9jQKpK2tB6oCQA=@lists.linux.dev, AJvYcCX18MhfBFGwYQf2MKeM1lsceMchsCekJk1pW07A8AgPp8V2jxlxB8UKbgh486DkIKD8/sQiuJr3ZDft95LCAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxijaKC77TMktKp8Wbz9/vlj6LjcTXpV5tx61HTTzkdfJ9Wx0lS
	b0QhvR6cgwzLjO1cNqVRPiWtbPH0O6PE+cTWPFZPnnSeNI2DRejF2Nm3Fr1h9l0zktky1tYnXJA
	E1eb5+JuKz4Q1+3ZfZHSrCBtjJTwof5E=
X-Gm-Gg: ASbGncuB8ZdIR52ERibIIeCwCgBxd3Q2I1ter9m9r+ue5UhJEl2Y6HO7kfg1nbwXSHc
	EfJEXpn7CvXa3jpwYeBli6AQlePKwzsDAhBc6kjSDoaq8vdqD92gFDYAGRpfJuCVT2X8M8HAyd+
	ACfjqobNYDwoDn6m0PQjxu35eG/z1HfOk8pfCX2JtVVQ==
X-Google-Smtp-Source: AGHT+IF218GiZpeI/D+rXXzILlAv1cDE70/cS0aOmmY37xRfNjnVhepbNq4j1eM5FlQuPv33Nwb46LfderGxoJgZ+S8=
X-Received: by 2002:a17:907:1c97:b0:ae3:c777:6e5e with SMTP id
 a640c23a62f3a-ae3dd25aca9mr88160166b.19.1751508458811; Wed, 02 Jul 2025
 19:07:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <78b06d1c7ae0677868e0c7498b589af163313c8d.1750939357.git.zhoubinbin@loongson.cn>
 <202507021011.sDAHGinj-lkp@intel.com> <20250702162318.GZ10134@google.com>
In-Reply-To: <20250702162318.GZ10134@google.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 3 Jul 2025 10:07:26 +0800
X-Gm-Features: Ac12FXxvQYgSR_pb1CaQhAd5356-n99IGXBSgkWflU0a6alpsxti5PcQ-gLfDuE
Message-ID: <CAMpQs4+hrJ8B4wZRmCH2T7wLAwnmD8_WH2OpNLWH64AbanZ-pw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
To: Lee Jones <lee@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Corey Minyard <minyard@acm.org>, oe-kbuild-all@lists.linux.dev, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io, 
	kexybiscuit@aosc.io, wangyao@lemote.com, Chong Qiao <qiaochong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee:

On Thu, Jul 3, 2025 at 12:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Wed, 02 Jul 2025, kernel test robot wrote:
>
> > Hi Binbin,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on 3d77b3cc7cc8115d89fa14eaf601e56372953484]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mfd-=
ls2kbmc-Introduce-Loongson-2K-BMC-core-driver/20250626-203353
> > base:   3d77b3cc7cc8115d89fa14eaf601e56372953484
> > patch link:    https://lore.kernel.org/r/78b06d1c7ae0677868e0c7498b589a=
f163313c8d.1750939357.git.zhoubinbin%40loongson.cn
> > patch subject: [PATCH v6 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset f=
unction support
> > config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/2=
0250702/202507021011.sDAHGinj-lkp@intel.com/config)
> > compiler: sparc64-linux-gcc (GCC) 15.1.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250702/202507021011.sDAHGinj-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202507021011.sDAHGinj-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/mfd/ls2k-bmc-core.c: In function 'ls2k_bmc_pdata_initial':
> > >> drivers/mfd/ls2k-bmc-core.c:349:15: error: implicit declaration of f=
unction 'acpi_register_gsi' [-Wimplicit-function-declaration]
> >      349 |         irq =3D acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSI=
TIVE, ACPI_ACTIVE_LOW);
> >          |               ^~~~~~~~~~~~~~~~~
> > >> drivers/mfd/ls2k-bmc-core.c:376:9: error: implicit declaration of fu=
nction 'acpi_unregister_gsi'; did you mean 'arch_unregister_cpu'? [-Wimplic=
it-function-declaration]
> >      376 |         acpi_unregister_gsi(gsi);
> >          |         ^~~~~~~~~~~~~~~~~~~
> >          |         arch_unregister_cpu
>
> Is this error valid?

Emm...

This error does exist if ACPI_GENERIC_GSI is not selected.
I will add this dependency in the next version.

depends on PCI && ACPI_GENERIC_GSI

>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

--=20
Thanks.
Binbin
