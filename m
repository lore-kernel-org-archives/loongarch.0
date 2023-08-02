Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3A9EDA
	for <loongarch@lists.linux.dev>; Wed,  2 Aug 2023 02:23:41 +0000 (UTC)
Received: from loongson.cn (unknown [209.85.221.54])
	by gateway (Coremail) with SMTP id _____8AxV_Ekvslk3YsOAA--.34734S3;
	Wed, 02 Aug 2023 10:23:33 +0800 (CST)
Received: from mail-wr1-f54.google.com (unknown [209.85.221.54])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxbSMivslkVtdEAA--.64339S3;
	Wed, 02 Aug 2023 10:23:31 +0800 (CST)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31771a876b5so5340258f8f.3
        for <loongarch@lists.linux.dev>; Tue, 01 Aug 2023 19:23:31 -0700 (PDT)
X-Gm-Message-State: ABy/qLbtjx/WT4GqLHqFFNT9FlG9iYk1tKawPw2pdorWl9Eeb85eExyk
	w47CfJEHS62HmgmLkzXrFuml6cBYq9YBZVPTN/icZQ==
X-Google-Smtp-Source: APBJJlF1uWj6wIOqIFlfDDRCiTD78Qq9g6nbp+t0la6vtmj1Gk53kAMeZOdghLi9R93+HK/Wj4Dz9sqyDT30UvH5UyU=
X-Received: by 2002:a05:6000:11c5:b0:317:594a:dbde with SMTP id
 i5-20020a05600011c500b00317594adbdemr3350887wrx.20.1690943009317; Tue, 01 Aug
 2023 19:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230801011554.3950435-1-guoren@kernel.org> <CAHirt9ht8AsE=FC8+222JDZXH3T58uLt+o=_pq+1zBhv1MKRjg@mail.gmail.com>
 <CAJF2gTRa5erHomJzLgUFO4SGqd5zSDwn6r3WN7kM8aWpv1vesg@mail.gmail.com>
 <CAJF2gTQ1hV1vipAo3H4X4WiPO84kVVFZcdGq7u4f0bVTry_akQ@mail.gmail.com>
 <CAHirt9gVqE=9vviJEY=kY=booVRmFPHrnFsKCXPXnXiWTB8bZQ@mail.gmail.com>
 <CAJF2gTR2ON33wc87iV564rkDbNiE56h_t0kzKKXdJtGqgJ1sOQ@mail.gmail.com>
 <CAHirt9i_osW_Dy5jNAnNOKrm-+38qN7SF+8ofNHePMAYhRKHsA@mail.gmail.com> <CAJF2gTSLD3jwzV59dGj_RENCvE0zMOAkLHqmT55bxL-4vA1wkA@mail.gmail.com>
In-Reply-To: <CAJF2gTSLD3jwzV59dGj_RENCvE0zMOAkLHqmT55bxL-4vA1wkA@mail.gmail.com>
From: WANG Rui <wangrui@loongson.cn>
Date: Wed, 2 Aug 2023 10:23:18 +0800
X-Gmail-Original-Message-ID: <CAHirt9iiA_zdBbmnmMNAEmvKBU-1imRxD7wG-0OmnPTsG2RJMA@mail.gmail.com>
Message-ID: <CAHirt9iiA_zdBbmnmMNAEmvKBU-1imRxD7wG-0OmnPTsG2RJMA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fixup cmpxchg sematic for memory barrier
To: Guo Ren <guoren@kernel.org>
Cc: chenhuacai@kernel.or, kernel@xen0n.name, arnd@arndb.de, 
	andi.shyti@linux.intel.com, andrzej.hajda@intel.com, peterz@infradead.org, 
	will@kernel.org, boqun.feng@gmail.com, mark.rutland@arm.com, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8CxbSMivslkVtdEAA--.64339S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWrtw4xtrW3tr1UKFWrKFyDArc_yoW8JrWDpr
	WIyFs0gFZ7Xw40ywsakw48ZFyrtwnaqF17X3sa9rZFyFyav343trW7Gry3XrsxZr93Gw1Y
	v3yq934FvFyDZFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
	Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWU
	AwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
	A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
	0xZFpf9x07jbPEfUUUUU=

On Wed, Aug 2, 2023 at 7:17=E2=80=AFAM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Aug 1, 2023 at 12:37=E2=80=AFPM WANG Rui <wangrui@loongson.cn> wr=
ote:
> >
> > On Tue, Aug 1, 2023 at 6:50=E2=80=AFPM Guo Ren <guoren@kernel.org> wrot=
e:
> > >
> > > On Tue, Aug 1, 2023 at 5:32=E2=80=AFPM WANG Rui <wangrui@loongson.cn>=
 wrote:
> > > > No. LL and LL won't reorder because LL implies a memory barrier(tho=
ugh
> > > > not acquire semantics).
> > > That means we could remove __WEAK_LLSC_MB totally, right?
> >
> > More precisely, __WEAK_LLSC_MB is intended to prevent reordering
> > between LL and normal LD used to fetch the expected value for cmpxchg.
> Oh, that's unnecessary when cmpxchg fails.
>
> Maybe you treat cmpxchg as a CoRR antidote in coincidence. Please
> solve the CoRR problem by READ_ONCE.
>
> See alpha architecture.

Unfortunately, the LL instruction has no acquire semantics. Even if
our kernel team improves READ_ONCE, it cannot prevent reordering
between LL and READ_ONCE after cmpxchg fails.

LL (<memory-barrier> + <load-exclusive>); WEAK_LLSC_MB; READ_ONCE
(<normal-load>); ...

vs

LL (<memory-barrier> + <load-exclusive>); READ_ONCE (<normal-load> +
<memory-barrier>); ...

Improving READ_ONCE is really important.

Regards,
--=20
WANG Rui

