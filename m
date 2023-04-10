Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325AC3C04
	for <loongarch@lists.linux.dev>; Mon, 10 Apr 2023 15:52:28 +0000 (UTC)
Received: from loongson.cn (unknown [209.85.221.50])
	by gateway (Coremail) with SMTP id _____8Cxhdi5MDRk0CgZAA--.39248S3;
	Mon, 10 Apr 2023 23:52:27 +0800 (CST)
Received: from mail-wr1-f50.google.com (unknown [209.85.221.50])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxsOS3MDRk9LscAA--.1706S3;
	Mon, 10 Apr 2023 23:52:24 +0800 (CST)
Received: by mail-wr1-f50.google.com with SMTP id s2so1590846wra.7
        for <loongarch@lists.linux.dev>; Mon, 10 Apr 2023 08:52:24 -0700 (PDT)
X-Gm-Message-State: AAQBX9d2/ZCF6WYJg6/WWTVbAduhuPYwc0odpgR9Jz0+thyoZGlxqs/Q
	iXK6ftNHajX7JIG4snbQGBbuBvsjBfVqujqMWBN3iQ==
X-Google-Smtp-Source: AKy350Z0SXibTASV3V5jFFGhYCSINQf+RkhcRYX2e1vgAs/Dg/6ZVuBxJjoOStAac+wkhGxIvtRbo4DzJAGY/ij5v9E=
X-Received: by 2002:a5d:6a8c:0:b0:2e5:e0e8:9c8d with SMTP id
 s12-20020a5d6a8c000000b002e5e0e89c8dmr1838322wru.13.1681141942492; Mon, 10
 Apr 2023 08:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230410115734.93365-1-wangrui@loongson.cn> <b80e083baa49f0443abee66eb888fac920f66e79.camel@xry111.site>
 <CAHirt9ib2LPXMbxb+UCJB1MsBnUuWNLb5+uyqcR5Wiw2fsJi6w@mail.gmail.com> <8aeb6d8dc4cbe8c992b69d75d8953d59b71a2c38.camel@xry111.site>
In-Reply-To: <8aeb6d8dc4cbe8c992b69d75d8953d59b71a2c38.camel@xry111.site>
From: WANG Rui <wangrui@loongson.cn>
Date: Mon, 10 Apr 2023 23:52:10 +0800
X-Gmail-Original-Message-ID: <CAHirt9hMbQcq34Dgtc5u3=841_hzjUc4TYiEbhchZO=jkCvbVA@mail.gmail.com>
Message-ID: <CAHirt9hMbQcq34Dgtc5u3=841_hzjUc4TYiEbhchZO=jkCvbVA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Improve memory ops
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8CxsOS3MDRk9LscAA--.1706S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E
	14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1CPfJUUUUU==

On Mon, Apr 10, 2023 at 10:36=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wro=
te:
>
> Hmm, yep, GCC does not take the advantage of -mstrict-align expanding
> memcpy etc.  I'll add it into my TODO list for GCC 14.

Great! It looks like you already have some good ideas, and I look
forward to hearing your good news.

Rui

