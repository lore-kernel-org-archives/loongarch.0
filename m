Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0808F1C02
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 22:44:37 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c0d0bf18d6so12152885ad.0
        for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 15:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693003477; x=1693608277;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:cc:to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EfHZKV5Rs50FUqRYXClC9vzZD5WlxrYeYbs3IamXT4=;
        b=YxGLOPcaOZR604IVjJRcGcoKnB33IZ0CTfYuHyWKXt+0pInUOQSMoNyJ0dS6B1KmgY
         cxaBOMvor3UlQ6MZnz8hco99YltIQ+TVGTfUiOj3M6EtIom4aLy5Ogu10qSlU6URXk+W
         RnRGmXEhLIg0POh+PDKptxk33OVTKsM2/52zz5494dr8R8CSNGpoqbrRI3gpmS9Q+cTN
         hJYUsHOFyiz+AcMtmJLq8rt6PHOWgX+jhYTNJt4ghkMZ1YZYHd+UADqGIVtKxfSRzrdW
         eHx1TWLsT9QLE3Re7SH9KzLMTXlxKvezJrH+R76CylIu77symnMHbROv+J2zJ4UP/BTK
         7yuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693003477; x=1693608277;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:cc:to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+EfHZKV5Rs50FUqRYXClC9vzZD5WlxrYeYbs3IamXT4=;
        b=Hz4HNbOfuLvFgcF0VUkOKqEVmSobu5JPAMdhQt8LvhGoXiNRJynUokWlx6YzKSuU6N
         vXxscrBu+jt6PD+1ol3FsNtf3n5VaHLd8JU/+AlzeCJ9jqgnc5G77wwzrMUAWxyaTuFv
         QQQ2hyxfImy7wyYQqaNy6zsKQvqtxFXo9RDFrdOXNa2N6d+VdZFE2SUy8lJykNCN/m+K
         HoUitbxibjiZZLUsX88vxaiVJ2LNatxbuQXR9+n8R3zoAlnkJ6WZW17pexaEBkClmFMg
         14BkmpzAzDqFL+gJ22aNx+6BYIN0BfNdooW0PzDz565L7RB4TJ9RjSjUg7yJ5Y8S5QHb
         kqNw==
X-Gm-Message-State: AOJu0Yx3IjrtKFq7+HXoR6bw0KFp8whMSWPOCC8wZYqIqfVdIsX49nJE
	MwI3qY2aBb1pLLe/q+K+5bY=
X-Google-Smtp-Source: AGHT+IHfISCtSa05UGz9PT6tDA2qtVyoG70cJPjb2fBEQ6/U+mzxDHROeZB/hJ4FR5D+DwWhbVxiGA==
X-Received: by 2002:a17:903:25d4:b0:1bd:bbc3:c87b with SMTP id jc20-20020a17090325d400b001bdbbc3c87bmr18047490plb.41.1693003477133;
        Fri, 25 Aug 2023 15:44:37 -0700 (PDT)
Received: from Schmitz-MacBook-Pro.local (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.googlemail.com with ESMTPSA id b1-20020a170902d50100b001adf6b21c77sm2280761plg.107.2023.08.25.15.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 15:44:36 -0700 (PDT)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, x86@kernel.org,
 Borislav Petkov <bp@alien8.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Richard Weinberger <richard@nod.at>, Bjorn Helgaas <bhelgaas@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-next@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20230810141947.1236730-1-arnd@kernel.org>
 <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
 <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
 <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: (subset) [PATCH 00/17] -Wmissing-prototype warning fixes
Message-ID: <130b3b57-edb0-184d-5b5f-69b013715773@gmail.com>
Date: Sat, 26 Aug 2023 10:44:13 +1200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Am 25.08.23 um 19:39 schrieb Geert Uytterhoeven:
> Hi Michael,
>
> On Fri, Aug 25, 2023 at 3:31=E2=80=AFAM Michael Schmitz <schmitzmic@gma=
il.com> wrote:
>> On 25/08/23 13:12, Martin K. Petersen wrote:
>>> [11/17] scsi: gvp11: remove unused gvp11_setup() function
>>>          https://git.kernel.org/mkp/scsi/c/bfaa4a0ce1bb
>> I somehow missed that one ...
>>
>> The gvp11_setup() function was probably a relic from the times before
>> module parameters.
>>
>> Since gvp11_xfer_mask appears to be required for some Amiga systems to=

>> set the DMA mask, I'd best send a patch to add such a module parameter=
 ...
>>
>> Do you know any details around the use of DMA masks for Amiga WD33C93
>> drivers, Geert?
> Doh, it's been a while, and I never had an affected system.
> Probably it's needed on A2000 with an accelerator card and GVP II SCSI,=

> to prevent DMA to RAM banks that do not support fast DMA cycles.

Thanks, that's good enough for me.

Linux 2.0 had this comment:

|/* * DMA transfer mask for GVP Series II SCSI controller. * Some
versions can only DMA into the 24 bit address space * (0->16M). Others
can DMA into the full 32 bit address * space. The default is to only
allow DMA into the 24 bit * address space. The "gvp11=3D0xFFFFFFFE" setup=

parameter can * be supplied to force an alternate (32 bit) mask. */ |

|We now handle that (since 2.6.35) through masks defined in
gvp11_zorro_tbl[] (though I note these don't account for unaligned
addresses such as implied by the example in the comment. Are unaligned
DMA buffers still possible today?). Would that cover the 'A2000 with
accelerator' case?
|

||

I'm happy to send a patch if an override to the device default DMA mask
is still necessary.

(Incidentally - did you ever publish the m68k full history tree anywhere
in git?)

Cheers,

=C2=A0=C2=A0=C2=A0 Michael


>
> Gr{oetje,eeting}s,
>
>                         Geert
>

