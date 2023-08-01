Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E424DC7B
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 16:37:11 +0000 (UTC)
Received: from loongson.cn (unknown [209.85.128.52])
	by gateway (Coremail) with SMTP id _____8AxV_G0NMlkUzcOAA--.34042S3;
	Wed, 02 Aug 2023 00:37:09 +0800 (CST)
Received: from mail-wm1-f52.google.com (unknown [209.85.128.52])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3c6yNMlksjREAA--.46489S3;
	Wed, 02 Aug 2023 00:37:08 +0800 (CST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fbf1b82d9cso54457905e9.2
        for <loongarch@lists.linux.dev>; Tue, 01 Aug 2023 09:37:07 -0700 (PDT)
X-Gm-Message-State: ABy/qLY/oI097IjgfNiM1cB6WU69CN0JQGerFVzJP2IRwN/Wl52IRaw2
	fywBmQs1jpvOCpHpsaXLBFmMP0QUNCVobrwbugTFlg==
X-Google-Smtp-Source: APBJJlEsXFVOA032jyj+Dhjdy9psDoGBoLGpotcERoVd/vis5xhG8Jrqhh+KxnT4tElWJUoX0rM/yvzkLUKc5S3mBMA=
X-Received: by 2002:a05:600c:141:b0:3fb:fca1:1965 with SMTP id
 w1-20020a05600c014100b003fbfca11965mr2677036wmm.18.1690907825594; Tue, 01 Aug
 2023 09:37:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230801011554.3950435-1-guoren@kernel.org> <CAHirt9ht8AsE=FC8+222JDZXH3T58uLt+o=_pq+1zBhv1MKRjg@mail.gmail.com>
 <CAJF2gTRa5erHomJzLgUFO4SGqd5zSDwn6r3WN7kM8aWpv1vesg@mail.gmail.com>
 <CAJF2gTQ1hV1vipAo3H4X4WiPO84kVVFZcdGq7u4f0bVTry_akQ@mail.gmail.com>
 <CAHirt9gVqE=9vviJEY=kY=booVRmFPHrnFsKCXPXnXiWTB8bZQ@mail.gmail.com> <CAJF2gTR2ON33wc87iV564rkDbNiE56h_t0kzKKXdJtGqgJ1sOQ@mail.gmail.com>
In-Reply-To: <CAJF2gTR2ON33wc87iV564rkDbNiE56h_t0kzKKXdJtGqgJ1sOQ@mail.gmail.com>
From: WANG Rui <wangrui@loongson.cn>
Date: Wed, 2 Aug 2023 00:36:54 +0800
X-Gmail-Original-Message-ID: <CAHirt9i_osW_Dy5jNAnNOKrm-+38qN7SF+8ofNHePMAYhRKHsA@mail.gmail.com>
Message-ID: <CAHirt9i_osW_Dy5jNAnNOKrm-+38qN7SF+8ofNHePMAYhRKHsA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fixup cmpxchg sematic for memory barrier
To: Guo Ren <guoren@kernel.org>
Cc: chenhuacai@kernel.or, kernel@xen0n.name, arnd@arndb.de, 
	andi.shyti@linux.intel.com, andrzej.hajda@intel.com, peterz@infradead.org, 
	will@kernel.org, boqun.feng@gmail.com, mark.rutland@arm.com, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8Ax3c6yNMlksjREAA--.46489S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUBvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwI
	xGrwCF54CYxVAaw2AFwI0_JF0_Jw1l4c8EcI0Ec7CjxVAaw2AFwI0_JF0_Jw1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=

On Tue, Aug 1, 2023 at 6:50=E2=80=AFPM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Aug 1, 2023 at 5:32=E2=80=AFPM WANG Rui <wangrui@loongson.cn> wro=
te:
> > No. LL and LL won't reorder because LL implies a memory barrier(though
> > not acquire semantics).
> That means we could remove __WEAK_LLSC_MB totally, right?

More precisely, __WEAK_LLSC_MB is intended to prevent reordering
between LL and normal LD used to fetch the expected value for cmpxchg.

Regards,
--=20
WANG Rui

