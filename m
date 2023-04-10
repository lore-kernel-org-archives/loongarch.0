Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CCD322B
	for <loongarch@lists.linux.dev>; Mon, 10 Apr 2023 14:22:58 +0000 (UTC)
Received: from loongson.cn (unknown [209.85.128.45])
	by gateway (Coremail) with SMTP id _____8BxPNq8GzRk7CEZAA--.27533S3;
	Mon, 10 Apr 2023 22:22:54 +0800 (CST)
Received: from mail-wm1-f45.google.com (unknown [209.85.128.45])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxLL66GzRkUqccAA--.30345S3;
	Mon, 10 Apr 2023 22:22:52 +0800 (CST)
Received: by mail-wm1-f45.google.com with SMTP id n19-20020a05600c501300b003f064936c3eso7775092wmr.0
        for <loongarch@lists.linux.dev>; Mon, 10 Apr 2023 07:22:52 -0700 (PDT)
X-Gm-Message-State: AAQBX9dTadtMnOod9f7JdcAyyJsfqgry/Arp8enCVGnKnDOCy0Hm9h4S
	4i9VeP5zcXZC7JVRokaAYJOCpKJvQ8GUS6Or00U1xg==
X-Google-Smtp-Source: AKy350at++pGQMV2onEnYp+vCGoDPiljaKXoVstrDYlsMwhZnhPuzQB23hvux4mWiW1fP+w9nLREELhRKQZ/Dh/lpZs=
X-Received: by 2002:a1c:4c10:0:b0:3ed:7664:6d79 with SMTP id
 z16-20020a1c4c10000000b003ed76646d79mr1560595wmf.0.1681136570453; Mon, 10 Apr
 2023 07:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230410115734.93365-1-wangrui@loongson.cn> <b80e083baa49f0443abee66eb888fac920f66e79.camel@xry111.site>
In-Reply-To: <b80e083baa49f0443abee66eb888fac920f66e79.camel@xry111.site>
From: Rui Wang <wangrui@loongson.cn>
Date: Mon, 10 Apr 2023 22:22:39 +0800
X-Gmail-Original-Message-ID: <CAHirt9ib2LPXMbxb+UCJB1MsBnUuWNLb5+uyqcR5Wiw2fsJi6w@mail.gmail.com>
Message-ID: <CAHirt9ib2LPXMbxb+UCJB1MsBnUuWNLb5+uyqcR5Wiw2fsJi6w@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Improve memory ops
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8BxLL66GzRkUqccAA--.30345S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7JFy5Kw1rKrW5ZryrXFyftFb_yoW3uwbE93
	WkK3yDuw4DJFZ7Gan8Kr47Ary3WFW5WF10kw1jgr4akryrXF1vvF1kWFy3Zryxta9YgF1D
	GrWYqF18AasFvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	27kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
	xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=

On Mon, Apr 10, 2023 at 8:54=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
> Regarding these functions: we have -ffreestanding which is preventing
> the compiler from optimizing for e.g. "memcpy(a, b, 8);" into a simple
> ld.d/st.d pair.  A explicit compiler built-in usage like
>
>   #define memcpy(a, b, c) __builtin_memcpy(a, b, c)
>
> would allow the compiler to do such kind of optimization.   Will this
> improve the performance?

That's a good question. IIUC, the current compiler generates
inefficient code for constant-length memcpy, which may sacrifice
performance for compatibility, as not all hardware supports unaligned
memory access. We need a runtime CPU feature dispatch mechanism
similar to alternatives to improve the compiler. This is indeed a
problem that needs to be addressed.

Regards,
Rui

