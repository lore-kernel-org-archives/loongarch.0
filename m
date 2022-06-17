Received: from 88.com (m34-101.88.com [104.250.34.101])
	by smtp.subspace.kernel.org (Postfix) with SMTP id A19CB17E5
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 12:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
	s=dkim; h=Date:From:To; bh=4XCBXCLzxxak2YSGmu6SoCDirNSPxQou6JLfm
	bwrXuk=; b=LrdyXRaAmLfB97jPiFg1u2ESwJBIin6IlAXAuM36V/sKsaCoYbyzy
	fvSuMN2vgPZDQqZy7oYwd29g0r4N0jdGmWvlW4/40IONGlx3VI5/Mm9LzqonZKQl
	qnM4QXZCkGX5ZnKYc04B8Z7zegrq6k5CY/UbRkuUw70PIS9ii1f/6w=
Received: from bobwxc.mipc (unknown [120.242.121.113])
	by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBH7hKTdqxiUJsMAA--.40168S2;
	Fri, 17 Jun 2022 20:41:56 +0800 (CST)
Date: Fri, 17 Jun 2022 20:41:55 +0800
From: Wu XiangCheng <bobwxc@email.cn>
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
	Alex Shi <alexs@kernel.org>, seakeel@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	Yanteng Si <siyanteng01@gmail.com>, loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: Re: [PATCH v3 1/2] docs/LoongArch: Fix notes rendering by using reST
 directives
Message-ID: <Yqx2k2V0ap3yD4aF@bobwxc.mipc>
References: <cover.1655463225.git.siyanteng@loongson.cn>
 <2da9b19588cfa20c3797015ea3ce6831b3a7fa2b.1655463225.git.siyanteng@loongson.cn>
 <CAAhV-H4ihtPn-3zKWaevvTKeCs=tdi8RQ8NaKoEU_XD44mEytg@mail.gmail.com>
 <ff1edf29-8b69-29fc-5ccd-26a6d6ef8bb9@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ff1edf29-8b69-29fc-5ccd-26a6d6ef8bb9@xen0n.name>
X-CM-TRANSID:GiKnCgBH7hKTdqxiUJsMAA--.40168S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtF15Kw45tFyUXr43Cw1Dtrb_yoW7Xr43pF
	WDJa9agrn5Xry7Aw17JF1fZF10yFs7JFs3Ww4kKr18A3ZxZwn5JF1ayF4rXFWUGry8Aay0
	vr18Ka1UWa4UA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgCb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
	CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
	Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2
	xKxwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCj
	c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
	vfC2KfnxnUUI43ZEXa7IUnLSdPUUUUU==
X-Originating-IP: [120.242.121.113]
X-CM-SenderInfo: pere453f6hztlloou0/

Hi all,

On Fri, Jun 17, 2022 at 07:49:22PM +0800, WANG Xuerui wrote:
> On 2022/6/17 19:05, Huacai Chen wrote:
> > Hi, Yanteng,
> > 
> > On Fri, Jun 17, 2022 at 6:55 PM Yanteng Si <siyanteng@loongson.cn> wrote:
> > > "Note" is an admonition, but it doesn't render
> > > correctly, let's fix it by using reST directives.
> > I think "but it doesn't render correctly" should be "but it isn't
> > correctly rendered in HTML". How do you think, Xuerui?
> This depends on what you mean by "correctly"; actually the original
> rendering is readable, only that it's not rendered with a "note" block.
> Maybe just "Notes are better expressed with reST admonitions."?

Agree with Xuerui.

> > 
> > Huacai
> > > Fixes: 0ea8ce61cb2c ("Documentation: LoongArch: Add basic documentations")
> > > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > > Reviewed-by: WANG Xuerui <git@xen0n.name>
> > > ---
> > >   Documentation/loongarch/introduction.rst   | 15 +++++++++------
> > >   Documentation/loongarch/irq-chip-model.rst | 22 +++++++++++++---------
> > >   2 files changed, 22 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/Documentation/loongarch/introduction.rst b/Documentation/loongarch/introduction.rst
> > > index 2bf40ad370df..216b3f390e80 100644
> > > --- a/Documentation/loongarch/introduction.rst
> > > +++ b/Documentation/loongarch/introduction.rst
> > > @@ -45,10 +45,12 @@ Name              Alias           Usage               Preserved
> > >   ``$r23``-``$r31`` ``$s0``-``$s8`` Static registers    Yes
> > >   ================= =============== =================== ============
> > > 
> > > -Note: The register ``$r21`` is reserved in the ELF psABI, but used by the Linux
> > > -kernel for storing the percpu base address. It normally has no ABI name, but is
> > > -called ``$u0`` in the kernel. You may also see ``$v0`` or ``$v1`` in some old code,
> > > -however they are deprecated aliases of ``$a0`` and ``$a1`` respectively.
> > > +.. Note::
> > > +    The register ``$r21`` is reserved in the ELF psABI, but used by the Linux
> > > +    kernel for storing the percpu base address. It normally has no ABI name,
> > > +    but is called ``$u0`` in the kernel. You may also see ``$v0`` or ``$v1``
> > > +    in some old code,however they are deprecated aliases of ``$a0`` and ``$a1``
> > > +    respectively.
> > > 
> > >   FPRs
> > >   ----
> > > @@ -69,8 +71,9 @@ Name              Alias              Usage               Preserved
> > >   ``$f24``-``$f31`` ``$fs0``-``$fs7``  Static registers    Yes
> > >   ================= ================== =================== ============
> > > 
> > > -Note: You may see ``$fv0`` or ``$fv1`` in some old code, however they are deprecated
> > > -aliases of ``$fa0`` and ``$fa1`` respectively.
> > > +.. Note::
> > > +    You may see ``$fv0`` or ``$fv1`` in some old code, however they are
> > > +    deprecated aliases of ``$fa0`` and ``$fa1`` respectively.
> > > 
> > >   VRs
> > >   ----
> > > diff --git a/Documentation/loongarch/irq-chip-model.rst b/Documentation/loongarch/irq-chip-model.rst
> > > index 8d88f7ab2e5e..7988f4192363 100644
> > > --- a/Documentation/loongarch/irq-chip-model.rst
> > > +++ b/Documentation/loongarch/irq-chip-model.rst
> > > @@ -145,12 +145,16 @@ Documentation of Loongson's LS7A chipset:
> > > 
> > >     https://github.com/loongson/LoongArch-Documentation/releases/latest/download/Loongson-7A1000-usermanual-2.00-EN.pdf (in English)
> > > 
> > > -Note: CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller described
> > > -in Section 7.4 of "LoongArch Reference Manual, Vol 1"; LIOINTC is "Legacy I/O
> > > -Interrupts" described in Section 11.1 of "Loongson 3A5000 Processor Reference
> > > -Manual"; EIOINTC is "Extended I/O Interrupts" described in Section 11.2 of
> > > -"Loongson 3A5000 Processor Reference Manual"; HTVECINTC is "HyperTransport
> > > -Interrupts" described in Section 14.3 of "Loongson 3A5000 Processor Reference
> > > -Manual"; PCH-PIC/PCH-MSI is "Interrupt Controller" described in Section 5 of
> > > -"Loongson 7A1000 Bridge User Manual"; PCH-LPC is "LPC Interrupts" described in
> > > -Section 24.3 of "Loongson 7A1000 Bridge User Manual".
> > > +.. Note::
> > > +    - CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller described
> > > +      in Section 7.4 of "LoongArch Reference Manual, Vol 1";
> > > +    - LIOINTC is "Legacy I/OInterrupts" described in Section 11.1 of
> > > +      "Loongson 3A5000 Processor Reference Manual";
> > > +    - EIOINTC is "Extended I/O Interrupts" described in Section 11.2 of
> > > +      "Loongson 3A5000 Processor Reference Manual";
> > > +    - HTVECINTC is "HyperTransport Interrupts" described in Section 14.3 of
> > > +      "Loongson 3A5000 Processor Reference Manual";
> > > +    - PCH-PIC/PCH-MSI is "Interrupt Controller" described in Section 5 of
> > > +      "Loongson 7A1000 Bridge User Manual";
> > > +    - PCH-LPC is "LPC Interrupts" described in Section 24.3 of
> > > +      "Loongson 7A1000 Bridge User Manual".

And one more thing, is it needed to use a footnote syntax here?
Like:

balabala... CPUINTC [#cpuintc]_

.. [#cpuintc] CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller described in Section 7.4 of "LoongArch Reference Manual, Vol 1";

Thanks,
    Wu

