Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6577322B
	for <loongarch@lists.linux.dev>; Mon, 10 Apr 2023 14:20:05 +0000 (UTC)
Received: from loongson.cn (unknown [209.85.128.46])
	by gateway (Coremail) with SMTP id _____8Axz_8SGzRksyEZAA--.38863S3;
	Mon, 10 Apr 2023 22:20:03 +0800 (CST)
Received: from mail-wm1-f46.google.com (unknown [209.85.128.46])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxyr0OGzRkvqYcAA--.30075S3;
	Mon, 10 Apr 2023 22:20:02 +0800 (CST)
Received: by mail-wm1-f46.google.com with SMTP id l26-20020a05600c1d1a00b003edd24054e0so4363460wms.4
        for <loongarch@lists.linux.dev>; Mon, 10 Apr 2023 07:20:01 -0700 (PDT)
X-Gm-Message-State: AAQBX9fJ3/s89NtfZIGq4G74RB9SCWsHQWIevQOHaJ/OuE1nwNmuJmPG
	xmvxY+iojmpix/HzDwXqZJ8oRTn8f3zdNe6ZHkem4Q==
X-Google-Smtp-Source: AKy350YZXNiBBM1EIRFVqDYPRhTbA1AdBFRq46FGsSzubrD07qtNxFiw40NpzFqHrk3GYLGwWeBqYK6eWi7ePA9PBls=
X-Received: by 2002:a1c:7708:0:b0:3ed:d2fc:2fe7 with SMTP id
 t8-20020a1c7708000000b003edd2fc2fe7mr2187905wmi.0.1681136398193; Mon, 10 Apr
 2023 07:19:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230410115734.93365-1-wangrui@loongson.cn> <c90c442fe029bfb9c4487284366800b8781954e1.camel@xry111.site>
In-Reply-To: <c90c442fe029bfb9c4487284366800b8781954e1.camel@xry111.site>
From: Rui Wang <wangrui@loongson.cn>
Date: Mon, 10 Apr 2023 22:19:47 +0800
X-Gmail-Original-Message-ID: <CAHirt9jXQcvSQPEFgW6B-qeakcRXGFfd1eYCw2g23Fmu4bbS8g@mail.gmail.com>
Message-ID: <CAHirt9jXQcvSQPEFgW6B-qeakcRXGFfd1eYCw2g23Fmu4bbS8g@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Improve memory ops
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8Dxyr0OGzRkvqYcAA--.30075S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUyKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E
	14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzsqWUUUUU

On Mon, Apr 10, 2023 at 8:20=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Mon, 2023-04-10 at 19:57 +0800, WANG rui wrote:
> > +       /* align up address */
> > +       andi    t1, a0, 7
> > +       sub.d   a0, a0, t1
>
> bstrins.d a0, zero, 2, 0
>
> Likewise for other aligning operations if the temporary is not used.

I think we're on the same page. I had previously tested this on the
user-space version[1], but it's not a performance-critical area.

[1] https://github.com/heiher/mem-bench/blob/0083d4e5a82e57939517413da3bcad=
81e01adbea/memset-int.S#L35-L37

Regards,
Rui

