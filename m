Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAD054BC6
	for <loongarch@lists.linux.dev>; Mon, 16 Jun 2025 07:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059374; cv=none; b=gdeBORtjlid0EnTdD+O3yD02HkDx+3uF/52JkUrNX1eMdVXhYfw9wlVeamNytT+zKqqb2HsuwXXb6/QDKvp9V9yIOnvESP2qpDdB3HFV9hGJ4i0uMjZLTj6ORbrqwFnhhb9jjLqXbrBvXU+aybdFG/31veMRp3JCJaB06awSqY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059374; c=relaxed/simple;
	bh=Gec46Ebz9gmOwxzMIq23DLKBHFsLv49y0dX7nyZzTCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhnOyxzMCTgorRtmAZ/LZaomQu2QnzAwjnt/8wXOHZpzZWYzPY5cMvjF2K98FwKu1V7DLJfL7bGhYW2mopwWoTK5A6nhaLSYwMxPY7XesSdfhVk3o9FeVPMTH/0ALWspjXBrH4pAkfHbHWJpkQi7A4rP56OSk7c3xn90duaSl9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyrSOVmG; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyrSOVmG"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-adb2e9fd208so843036066b.3
        for <loongarch@lists.linux.dev>; Mon, 16 Jun 2025 00:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750059371; x=1750664171; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wU1oG7H72y9LlZqotS0mwDe6thKNL/B9NNAecD+xUvo=;
        b=HyrSOVmGTqBZMKK7/IY4hnpYGI0J0sxOmjHmJ7C+LKvPysWst3wfDW6Y4faDb2QGNF
         llzbCCJL/HdY6DfYMLJeW54ah1NqmGfe6qiqU3Hj9R8hbceOHfTLNTbZNLd05IFiKn4v
         1GCg6mKw57d/qpSntLMndwLxDz0aI8L2qvXISHLbw0KBuI8UOWIrljtG3K3joOFs31by
         T5Ddo7aUDVkzq2lnMXSS2NDOocrjuD4IVFc5IcxiXzIYrWKzL1zTMoBnuBgqYs4nyt9F
         1WMenn9VyXddn1HhopiPCgd/TT8ymZHu0pzV1msgYI3DhAX2+HD7RssQ58kaFa84exs2
         urLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059371; x=1750664171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wU1oG7H72y9LlZqotS0mwDe6thKNL/B9NNAecD+xUvo=;
        b=Qe1b1rjtbYB/+/lkkubtqO/b4Kp1w5lJpXOYWQN/NcwBRLB3rjjvZZFPpFBDrUHHVD
         4pkHCHofLjOBatPrC3C6K1wJ7epwdK65AEzBRw1Beup/uU01bkgBJQ1AnIMuzaoL3Xib
         XeCNM0c2LlceZz0SyMOq/usd8lkGCArWKboyF4YLOSdkFw/BtoogHy2S1XYWiNzEJ+Tu
         7ihX+yJrNSK043QqUKZw7LcETfWI+uObQAGWeSg0CebyetVFW/IxL3xQDPrG+4++gnRl
         WKcB3Pr+YRAPeWnvdT5AKo5sORTkXvEJxMKtMtwkJnqe2du4u9kaQp2pzrX9BHkH81Fg
         v6EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWej0aRWK8F+mgsqZJeEG6ZcAlsF5t1zczi7nThogemOSeiSoOlKyBFE6FLsENrlTejjC/ia83Tu0M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxptO6maTJQsDHMVOy/I6QqGvTenDYg6qFm/AHkGQMCvgSlS7aS
	+3+YJygVRDIgnf0cCIiVYFxpPLgYCWKBYG4qETz+CvnCfx4ADZAXdgEbNcZj0nXK8bdSzNPApZH
	/dzMLZeMEWxjtzawIM6yPQ3+EbpziOWA=
X-Gm-Gg: ASbGncsZBst4ntVjW2n4hYaGpAudp8DjQNFcoA3tGspEluwbeZGkbv154KG/qwIvl3Z
	KSRkwuP6CeAzmlr2IcEWJZ6rg8/os+a2GZO9cE1AsPcp+E6UL/SGP2BjANrY5NVs0ZEsTLuiBtt
	LEao/R7Zv3hLJzGcoePQOvcms0i9vFEKkGzmZ3tFpG4A==
X-Google-Smtp-Source: AGHT+IFhdMns7mGfB4OOKjKukqaWr54jftIy99YeXLhyAoFjjVx1zn8pBV+Gz5xrKSa9BZBiHMOMVchHNEIe/4dqAFY=
X-Received: by 2002:a17:907:971f:b0:ad8:9b5d:2c1e with SMTP id
 a640c23a62f3a-adfad54b2f3mr833356466b.29.1750059370706; Mon, 16 Jun 2025
 00:36:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1749731531.git.zhoubinbin@loongson.cn> <aEzFPdYEvbkaH_B5@mail.minyard.net>
 <CAMpQs4L66sXLdj6+ebMXcwq4i+XVi+AmwBbQSx0-EuULNJ5XeQ@mail.gmail.com>
 <aEzqbLHSB6phFNox@mail.minyard.net> <CAMpQs4L82x=OhLQJb96ZC4YfT_ZhHcU+zks2r0HMU0Y2fjwsbg@mail.gmail.com>
 <aE2AR8rj9OEM8TcB@mail.minyard.net>
In-Reply-To: <aE2AR8rj9OEM8TcB@mail.minyard.net>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 16 Jun 2025 15:35:56 +0800
X-Gm-Features: AX0GCFuQEKVTd-Nc6H5MF5H9uYOCTg6JdkmVUSj8qovSKZFwGKYTNBkCAVsd17M
Message-ID: <CAMpQs4+5hapiYv_M4px0XkcXiCd7cCpyb55APKt+uh1iBaor3Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] LoongArch: Add Loongson-2K BMC support
To: corey@minyard.net
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io, 
	kexybiscuit@aosc.io, wangyao@lemote.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Corey:

Thanks  for your detailed review.

On Sat, Jun 14, 2025 at 9:59=E2=80=AFPM Corey Minyard <corey@minyard.net> w=
rote:
>
> On Sat, Jun 14, 2025 at 01:25:17PM +0800, Binbin Zhou wrote:
> > Hi Corey:
> >
> > Thanks for your detailed suggestions.
> >
> > On Sat, Jun 14, 2025 at 11:20=E2=80=AFAM Corey Minyard <corey@minyard.n=
et> wrote:
> > >
> > > On Sat, Jun 14, 2025 at 10:50:37AM +0800, Binbin Zhou wrote:
> > > > Hi Corey:
> > > >
> > > > On Sat, Jun 14, 2025 at 8:41=E2=80=AFAM Corey Minyard <corey@minyar=
d.net> wrote:
> > > > >
> > > > > On Fri, Jun 13, 2025 at 02:43:38PM +0800, Binbin Zhou wrote:
> > > > > > Hi all:
> > > > > >
> > > > > > This patch set introduces the Loongson-2K BMC.
> > > > > >
> > > > > > It is a PCIe device present on servers similar to the Loongson-=
3 CPUs.
> > > > > > And it is a multifunctional device (MFD), such as display as a =
sub-function
> > > > > > of it.
> > > > >
> > > > > I've asked this before, but I haven't gotten a answer, I don't th=
ink.
> > > > >
> > > > > Is this really a multi-function device?  Is there (or will there =
be)
> > > > > another driver that uses the MFD code?
> > > >
> > > > I am very sorry, I may have overlooked your previous question.
> > > >
> > > > And I also may not have a thorough understanding of multifunction d=
evices.
> > > >
> > > > The Loongson-2K BMC device provides two functions: display and IPMI=
.
> > > > For display, we pass the simplefb_platform_data parameter and regis=
ter
> > > > the simpledrm device, as shown in patch-1.
> > > >
> > > > Therefore, I think this should be considered a multifunction device=
.
> > >
> > > Ok, that's clear, thank you.
> > >
> > > However, that's not really very clear from the patches you have
> > > provided.  Particularly, the "bmc" in the name from patch 1 makes one
> > > think that it's only a bmc.
> > >
> > > The "bmc" name is also a little confusing; the devices with a "bmc" i=
n
> > > the name are all the BMC side, but you are doing a host side device.
> > >
> > > If you look at most of the other MFDs, they have a "core" section the=
n
> > > various other parts that use the core.  And possibly parts in other
> > > directories for individual functions.  I think you need to do the sam=
e
> > > design.  Have a "core" section that both the display and bmc use, the=
n a
> > > separate display and bmc driver.
> >
> > If it can be reconstructed in this way, it should be clearer.
> >
> > However, there is a key point in my mind: if the display and IPMI are
> > separated into two parts, they should at least be able to be probed
> > separately, but in fact they belong to the same PCI-E device, just
> > allocated different resource intervals.
> >
> > static struct pci_device_id ls2k_bmc_devices[] =3D {
> >        { PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x1a05) },
> >        { }
> > };
> > MODULE_DEVICE_TABLE(pci, ls2k_bmc_devices);
> >
> > I'm not sure if my understanding is correct?
>
> You are already doing this, it appears.  I spent a little time to learn
> how this works.  You are using the standard frame buffer driver, so no
> special driver is required there (per earlier discussions).  And you are
> registering it all as an MFD device, so the display buffer and IPMI
> interface will pick it up there.
>
> So from a design point of view this all looks good.
>
> The IPMI interface needs to be separately selectable from the main mfd
> device in the Kconfigs.  Add an IPMI_LS2K config in the IPMI section
> that enables the IPMI interface and selects MFD_LS2K_BMC.  And both
> configs need to be tristate, not bool, so they can be modules.

I tried rewriting Kconfig as follows:

IPMI Kconfig:

config IPMI_LS2K
       bool 'Loongson-2K IPMI interface'
       depends on LOONGARCH
       select MFD_LS2K_BMC_CORE
       help
         Provides a driver for Loongson-2K IPMI interfaces.

MFD Kconfig:

config MFD_LS2K_BMC_CORE
        bool "Loongson-2K Board Management Controller Support"
        select MFD_CORE


However, `tristate` does not seem to work.
On the IPMI side, in order to better reuse code, our driver is not
actually a completely independent driver; it is part of `ipmi_si`.

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_i=
ntf.c
index 7fe891783a37..c13d5132fffc 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -2120,6 +2120,8 @@ static int __init init_ipmi_si(void)

        ipmi_si_pci_init();

+       ipmi_si_ls2k_init();
+
        ipmi_si_parisc_init();

        mutex_lock(&smi_infos_lock);
@@ -2334,6 +2335,8 @@ static void cleanup_ipmi_si(void)

        ipmi_si_pci_shutdown();

+       ipmi_si_ls2k_shutdown();
+
        ipmi_si_parisc_shutdown();

        ipmi_si_platform_shutdown();


Therefore, it seems that we can only use `bool` here, otherwise an
error will occur during compilation, as seen in the V3 patchset[1]:

[1]: https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp@intel.com/

>
> I don't know if you want to make the display part so it can be enabled
> separately, I'm not sure how you would do that.  But that's not my
> concern, really.
>
> Thanks,
>
> -corey
>
> >
> > >
> > > That way, you can use the display without the IPMI interface, or the
> > > IPMI interface without the display.
> > >
> > > I would like to see:
> > >
> > > * A core mfd device named ls2k-core.c that has the core functions.
> > >   It would have its own config item (MFD_LS2K) that would be
> > >   selected if either the display or IPMI device is enabled.
> > >
> > > * A separate display device in its own file with its own config item.
> > >   This isn't my area, so I'm not sure where this should go.
> > >
> > > * The IPMI device in the ipmi directory named ipmi_ls2k.c, again
> > >   with it's own config item (IPMI_LS2K).
> > >
> > > Does that make sense?  I don't want to make things too hard, but that=
's
> > > the way pretty much everything else is done on MFDs.
> > >
> > > Thanks,
> > >
> > > -corey
> > >
> > > >
> > > > >
> > > > > If nothing else is going to use this, then it's really not a
> > > > > multi-function device and all the code can go into the IPMI direc=
tory.
> > > > > That simplifies maintenance.
> > > > >
> > > > > If it is a multi-function device, then I want two separate Kconfi=
g
> > > > > items, one for the MFD and one for the IPMI portion.  That way it=
's
> > > > > ready and you don't have to bother about the IPMI portion when
> > > > > adding the other device.
> > > > >
> > > > > All else looks good, I think.
> > > > >
> > > > > -corey
> > > > >
> > > > > >
> > > > > > For IPMI, according to the existing design, we use software sim=
ulation to
> > > > > > implement the KCS interface registers: Stauts/Command/Data_Out/=
Data_In.
> > > > > >
> > > > > > Also since both host side and BMC side read and write kcs statu=
s, we use
> > > > > > fifo pointer to ensure data consistency.
> > > > > >
> > > > > > For the display, based on simpledrm, the resolution is read fro=
m a fixed
> > > > > > position in the BMC since the hardware does not support auto-de=
tection
> > > > > > of the resolution. Of course, we will try to support multiple
> > > > > > resolutions later, through a vbios-like approach.
> > > > > >
> > > > > > Especially, for the BMC reset function, since the display will =
be
> > > > > > disconnected when BMC reset, we made a special treatment of re-=
push.
> > > > > >
> > > > > > Based on this, I will present it in four patches:
> > > > > > patch-1: BMC device PCI resource allocation.
> > > > > > patch-2: BMC reset function support
> > > > > > patch-3: IPMI implementation
> > > > > >
> > > > > > Thanks.
> > > > > >
> > > > > > -------
> > > > > > V4:
> > > > > > - Add Reviewed-by tag;
> > > > > > - Change the order of the patches.
> > > > > > Patch (1/3):
> > > > > >   - Fix build warning by lkp: Kconfig tristate -> bool
> > > > > >     - https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp@int=
el.com/
> > > > > >  - Update commit message;
> > > > > >  - Move MFD_LS2K_BMC after MFD_INTEL_M10_BMC_PMCI in Kconfig an=
d
> > > > > >    Makefile.
> > > > > > Patch (2/3):
> > > > > >   - Remove unnecessary newlines;
> > > > > >   - Rename ls2k_bmc_check_pcie_connected() to
> > > > > >     ls2k_bmc_pcie_is_connected();
> > > > > >   - Update comment message.
> > > > > > Patch (3/3):
> > > > > >   - Remove unnecessary newlines.
> > > > > >
> > > > > > Link to V3:
> > > > > > https://lore.kernel.org/all/cover.1748505446.git.zhoubinbin@loo=
ngson.cn/
> > > > > >
> > > > > > V3:
> > > > > > Patch (1/3):
> > > > > >  - Drop "MFD" in title and comment;
> > > > > >  - Fromatting code;
> > > > > >  - Add clearer comments.
> > > > > > Patch (2/3):
> > > > > >  - Rebase linux-ipmi/next tree;
> > > > > >  - Use readx()/writex() to read and write IPMI data instead of =
structure
> > > > > >    pointer references;
> > > > > >  - CONFIG_LOONGARCH -> MFD_LS2K_BMC;
> > > > > >  - Drop unused output.
> > > > > > Patch (3/3):
> > > > > >  - Inline the ls2k_bmc_gpio_reset_handler() function to ls2k_bm=
c_pdata_initial();
> > > > > >  - Add clearer comments.
> > > > > >  - Use proper multi-line commentary as per the Coding Style doc=
umentation;
> > > > > >  - Define all magic numbers.
> > > > > >
> > > > > > Link to V2:
> > > > > > https://lore.kernel.org/all/cover.1747276047.git.zhoubinbin@loo=
ngson.cn/
> > > > > >
> > > > > > V2:
> > > > > > - Drop ls2kdrm, use simpledrm instead.
> > > > > > Patch (1/3):
> > > > > >  - Use DEFINE_RES_MEM_NAMED/MFD_CELL_RES simplified code;
> > > > > >  - Add resolution fetching due to replacing the original displa=
y
> > > > > >    solution with simpledrm;
> > > > > >  - Add aperture_remove_conflicting_devices() to avoid efifb
> > > > > >    conflict with simpledrm.
> > > > > > Patch (3/3):
> > > > > >  - This part of the function, moved from the original ls2kdrm t=
o mfd;
> > > > > >  - Use set_console to implement the Re-push display function.
> > > > > >
> > > > > > Link to V1:
> > > > > > https://lore.kernel.org/all/cover.1735550269.git.zhoubinbin@loo=
ngson.cn/
> > > > > >
> > > > > > Binbin Zhou (3):
> > > > > >   mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
> > > > > >   mfd: ls2kbmc: Add Loongson-2K BMC reset function support
> > > > > >   ipmi: Add Loongson-2K BMC support
> > > > > >
> > > > > >  drivers/char/ipmi/Makefile       |   1 +
> > > > > >  drivers/char/ipmi/ipmi_si.h      |   7 +
> > > > > >  drivers/char/ipmi/ipmi_si_intf.c |   3 +
> > > > > >  drivers/char/ipmi/ipmi_si_ls2k.c | 189 ++++++++++++
> > > > > >  drivers/mfd/Kconfig              |  12 +
> > > > > >  drivers/mfd/Makefile             |   2 +
> > > > > >  drivers/mfd/ls2kbmc-mfd.c        | 485 +++++++++++++++++++++++=
++++++++
> > > > > >  7 files changed, 699 insertions(+)
> > > > > >  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
> > > > > >  create mode 100644 drivers/mfd/ls2kbmc-mfd.c
> > > > > >
> > > > > >
> > > > > > base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
> > > > > > --
> > > > > > 2.47.1
> > > > > >
> > > >
> > > >
> > > > --
> > > > Thanks.
> > > > Binbin
> >
> > --
> > Thanks.
> > Binbin

--=20
Thanks.
Binbin
