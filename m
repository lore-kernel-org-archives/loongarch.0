Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7B71F955
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 09:30:49 +0000 (UTC)
Received: from loongson.cn (unknown [209.85.128.50])
	by gateway (Coremail) with SMTP id _____8DxxPDG0MhkZAEOAA--.33694S3;
	Tue, 01 Aug 2023 17:30:47 +0800 (CST)
Received: from mail-wm1-f50.google.com (unknown [209.85.128.50])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxjiPF0MhkAMpDAA--.4945S3;
	Tue, 01 Aug 2023 17:30:46 +0800 (CST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fbc59de0e2so50637315e9.3
        for <loongarch@lists.linux.dev>; Tue, 01 Aug 2023 02:30:46 -0700 (PDT)
X-Gm-Message-State: ABy/qLbb197aoul6Qd5Hr/OnzEw8NCJJD1N9NWxUvSuCYlomeiJq7UMJ
	ImIRonmd59Vu1bghRK5t+t8agDFP4JQ9+sy/lvwi4g==
X-Google-Smtp-Source: APBJJlFL0f5c65vH+FERRq95p4j8qrALvRiIHJcQv3dFHYZmyAKStT05me5UsGMEKTgrx/mqaZFFQzGRUPUduCg+Vuk=
X-Received: by 2002:adf:edcd:0:b0:314:8d:7eb5 with SMTP id v13-20020adfedcd000000b00314008d7eb5mr1919533wro.29.1690882244713;
 Tue, 01 Aug 2023 02:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230801011554.3950435-1-guoren@kernel.org> <CAHirt9ht8AsE=FC8+222JDZXH3T58uLt+o=_pq+1zBhv1MKRjg@mail.gmail.com>
 <20230801083201.GB26036@willie-the-truck>
In-Reply-To: <20230801083201.GB26036@willie-the-truck>
From: WANG Rui <wangrui@loongson.cn>
Date: Tue, 1 Aug 2023 17:30:33 +0800
X-Gmail-Original-Message-ID: <CAHirt9ggujWPw7KV7qSGjk=-nX16U+u1MwNGSLEkoogcJjOHFA@mail.gmail.com>
Message-ID: <CAHirt9ggujWPw7KV7qSGjk=-nX16U+u1MwNGSLEkoogcJjOHFA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fixup cmpxchg sematic for memory barrier
To: Will Deacon <will@kernel.org>
Cc: guoren@kernel.org, chenhuacai@kernel.or, kernel@xen0n.name, arnd@arndb.de, 
	andi.shyti@linux.intel.com, andrzej.hajda@intel.com, peterz@infradead.org, 
	boqun.feng@gmail.com, mark.rutland@arm.com, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8AxjiPF0MhkAMpDAA--.4945S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUU9ab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2
	Ij64vIr41l4c8EcI0En4kS14v26r1Y6r17MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
	1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU1CPfJUUUUU==

Hello,

On Tue, Aug 1, 2023 at 4:32=E2=80=AFPM Will Deacon <will@kernel.org> wrote:
>
> Hmm, somehow this one passed me by, but I think that puts you in the naug=
hty
> corner with Itanium. It probably also means your READ_ONCE() is broken,
> unless the compiler emits barriers for volatile reads (like ia64)?

Hmm, I agree with your perspective. Allowing out-of-order loads for
the same address in the memory model provides certain performance
benefits, but it also poses challenges to software. Fortunately,
hardware supports software to disable this feature when needed.

Regards,
--=20
WANG Rui

