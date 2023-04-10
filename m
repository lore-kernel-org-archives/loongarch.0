Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3B33C04
	for <loongarch@lists.linux.dev>; Mon, 10 Apr 2023 15:54:19 +0000 (UTC)
Received: from loongson.cn (unknown [209.85.221.54])
	by gateway (Coremail) with SMTP id _____8BxIk4qMTRkDikZAA--.38718S3;
	Mon, 10 Apr 2023 23:54:18 +0800 (CST)
Received: from mail-wr1-f54.google.com (unknown [209.85.221.54])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxIL8lMTRkVbwcAA--.65101S3;
	Mon, 10 Apr 2023 23:54:17 +0800 (CST)
Received: by mail-wr1-f54.google.com with SMTP id v29so4876871wra.13
        for <loongarch@lists.linux.dev>; Mon, 10 Apr 2023 08:54:16 -0700 (PDT)
X-Gm-Message-State: AAQBX9fE5k6EBJxjfZsQ1KDHDhOTnBkbAnpfzTEoR5ypFobihdaWEqan
	6KbwaciUu3d+/61zFRjSR7v8L/hpScxdHOS6eNqbYA==
X-Google-Smtp-Source: AKy350ZAuQTgY0PQc2XWYXAUmPOujcjixIrHnF9HRJ9jXsgcZ+54prxApgwGkqm1CXbvxaqr9+20hrzUfJPrWRTcgEY=
X-Received: by 2002:a5d:6a8c:0:b0:2e5:e0e8:9c8d with SMTP id
 s12-20020a5d6a8c000000b002e5e0e89c8dmr1839172wru.13.1681142051984; Mon, 10
 Apr 2023 08:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230410115734.93365-1-wangrui@loongson.cn> <c90c442fe029bfb9c4487284366800b8781954e1.camel@xry111.site>
 <CAHirt9jXQcvSQPEFgW6B-qeakcRXGFfd1eYCw2g23Fmu4bbS8g@mail.gmail.com> <f568fd917bb8789fcef4206e256ef045176605e2.camel@xry111.site>
In-Reply-To: <f568fd917bb8789fcef4206e256ef045176605e2.camel@xry111.site>
From: WANG Rui <wangrui@loongson.cn>
Date: Mon, 10 Apr 2023 23:53:59 +0800
X-Gmail-Original-Message-ID: <CAHirt9gnFGF1kbGFYxcNHjxpysXRLLWjX6mrcOKaN=g7E-uBQw@mail.gmail.com>
Message-ID: <CAHirt9gnFGF1kbGFYxcNHjxpysXRLLWjX6mrcOKaN=g7E-uBQw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Improve memory ops
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8AxIL8lMTRkVbwcAA--.65101S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUBGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E
	14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7V
	AKI48JMxAqzxv262kKe7AKxVWUAVWUtwCF54CYxVCY1x0262kKe7AKxVWUAVWUtwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UWHqcUUUUU=

On Mon, Apr 10, 2023 at 10:38=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wro=
te:
>
> The point is "if you can reduce one instruction and one register usage
> with no harm, why not do it?" :)
>
> AFAIK bstrins.d should be available on all 64-bit LoongArch CPUs.

Hmm, I will make the change in the next version. :)

Rui

