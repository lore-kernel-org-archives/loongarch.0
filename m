Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8134A3B
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 12:56:25 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id s17so7329009qkj.12
        for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 05:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9HBrugsK31TJm1JiE6A5CYKBZDunxsHKdFGHyRGfLo=;
        b=bDV1B6sp/q5DMwZrn5qnKIJCUmRiDP2s6mkoweMvBc2jszKdDMs+De0bM8YtFQINv3
         Wktw9gGZYbI0de2wmWsHPrZTwrCxroaJmJaNClJ0agAoZM/U4VvaGwv8DhQWlLklXK8n
         oii4W5kX+qYmQHKPx42qP4boUz1xT7GOGuV2sd8GBSc9i048CpEWZw1WxvB+tsbqG+cj
         WvPRAhMtoX7Dgp4ISdwf+3D4x+pS3OH03OphrXv0b/EXfnjoaZmQg1abWVvPuqMtnTm5
         zfhaDvvCbbOO6G6d+u/TcsCnbBF13lVF0QRxwNf+LJgEwF/0EhZVChMFEGgPrFlH6Lqf
         e6Wg==
X-Gm-Message-State: ACrzQf0P2qWMzFJEY6CWMiIaDC/ZAJ+nAv14xk3ZpuZarZAPUYdRGY+O
	gh44aagmqjAE+729i5GzXjMb5pFBglbZRGe77nI=
X-Google-Smtp-Source: AMsMyM4+Icbq+yeVGzKx5N3fr5SyZdlowFI47yvEYlUO9UU26C+9m1bQhevIGOSoy14JK5XUR5/Iu4Xba/JoFGYkAz8=
X-Received: by 2002:a05:620a:4687:b0:6ee:e69c:e3f1 with SMTP id
 bq7-20020a05620a468700b006eee69ce3f1mr1597151qkb.285.1666097784790; Tue, 18
 Oct 2022 05:56:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220911090635.5559-1-lvjianmin@loongson.cn> <20220911090635.5559-2-lvjianmin@loongson.cn>
 <8e9df8ea-06f0-3989-2563-d5dc6b09a062@huawei.com> <CAJZ5v0gBBdTxRkE08PO8W+yi1eTkWqzpGLAyMNuzZmqx02EzFA@mail.gmail.com>
 <c7ae3a66-1d24-1014-b63a-8d4af3de42c8@arm.com> <7904cd2e-caf5-0073-9889-306ab524d802@huawei.com>
 <ded07a34-0cf4-3f76-a538-fb6a9abd6673@loongson.cn>
In-Reply-To: <ded07a34-0cf4-3f76-a538-fb6a9abd6673@loongson.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 18 Oct 2022 14:56:13 +0200
Message-ID: <CAJZ5v0i5jo-+B6sq5Aftj_TR=dj4gt-4aiXhbu2BW-=KETQgFw@mail.gmail.com>
Subject: Re: [PATCH V5 1/2] ACPI / scan: Support multiple dma windows with
 different offsets
To: Jianmin Lv <lvjianmin@loongson.cn>
Cc: Yicong Yang <yangyicong@huawei.com>, Robin Murphy <robin.murphy@arm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, yangyicong@hisilicon.com, lpieralisi@kernel.org, 
	chenhuacai@loongson.cn, guohanjun@huawei.com, sudeep.holla@arm.com, 
	lenb@kernel.org, robert.moore@intel.com, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, loongarch@lists.linux.dev, 
	liulongfang <liulongfang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 2:50 PM Jianmin Lv <lvjianmin@loongson.cn> wrote:
>
>
>
> On 2022/10/18 =E4=B8=8B=E5=8D=888:32, Yicong Yang wrote:
> > On 2022/10/18 20:00, Robin Murphy wrote:
> >> On 2022-10-18 11:08, Rafael J. Wysocki wrote:
> >>> On Tue, Oct 18, 2022 at 11:33 AM Yicong Yang <yangyicong@huawei.com> =
wrote:
> >>>>
> >>>> On 2022/9/11 17:06, Jianmin Lv wrote:
> >>>>> In DT systems configurations, of_dma_get_range() returns struct
> >>>>> bus_dma_region DMA regions; they are used to set-up devices
> >>>>> DMA windows with different offset available for translation between=
 DMA
> >>>>> address and CPU address.
> >>>>>
> >>>>> In ACPI systems configuration, acpi_dma_get_range() does not return
> >>>>> DMA regions yet and that precludes setting up the dev->dma_range_ma=
p
> >>>>> pointer and therefore DMA regions with multiple offsets.
> >>>>>
> >>>>> Update acpi_dma_get_range() to return struct bus_dma_region
> >>>>> DMA regions like of_dma_get_range() does.
> >>>>>
> >>>>> After updating acpi_dma_get_range(), acpi_arch_dma_setup() is chang=
ed for
> >>>>> ARM64, where the original dma_addr and size are removed as these
> >>>>> arguments are now redundant, and pass 0 and U64_MAX for dma_base
> >>>>> and size of arch_setup_dma_ops; this is a simplification consistent
> >>>>> with what other ACPI architectures also pass to iommu_setup_dma_ops=
().
> >>>>>
> >>>>
> >>>> Hi,
> >>>>
> >>>> With this patch we met problem as well. The DMA coherent mask is not=
 set correctly
> >>>> for a ehci usb controller and lead to the below calltrace:
> >>>>
> >>>> [   16.699259] ------------[ cut here ]------------
> >>>> [   16.703855] WARNING: CPU: 0 PID: 853 at kernel/dma/mapping.c:499 =
dma_alloc_attrs+0xc0/0xf0
> >>>> [   16.712082] Modules linked in:
> >>>> [   16.715124] CPU: 0 PID: 853 Comm: kworker/0:3 Not tainted 6.1.0-r=
c1-pipe-deadlock+ #5
> >>>> [   16.722916] Hardware name: Huawei TaiShan 2280 V2/BC82AMDC, BIOS =
2280-V2 CS V5.B211.01 11/10/2021
> >>>> [   16.731745] Workqueue: events work_for_cpu_fn
> >>>> [   16.736083] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS=
 BTYPE=3D--)
> >>>> [   16.743013] pc : dma_alloc_attrs+0xc0/0xf0
> >>>> [   16.747091] lr : dma_pool_alloc+0x11c/0x200
> >>>> [   16.751255] sp : ffff80001e46bb50
> >>>> [   16.754554] x29: ffff80001e46bb50 x28: 0000000000000000 x27: 0000=
000000000000
> >>>> [   16.761657] x26: ffff80000b33ce18 x25: ffff800009cc6c48 x24: 0000=
000000000000
> >>>> [   16.768759] x23: ffff00208c830918 x22: 0000000000001000 x21: 0000=
000000000cc0
> >>>> [   16.775861] x20: ffff00208ae82080 x19: ffff0020865c40d0 x18: 0000=
000000000030
> >>>> [   16.782964] x17: 626d756e20737562 x16: 2064656e67697373 x15: ffff=
00208ae82640
> >>>> [   16.790066] x14: 0000000000000000 x13: 646e756f72616b72 x12: 6f77=
204348207379
> >>>> [   16.797167] x11: 73706f6e79532067 x10: ffff205f43980000 x9 : ffff=
80000830b3ac
> >>>> [   16.804269] x8 : ffff0020861b1b00 x7 : 0000000000000000 x6 : 0000=
000000000000
> >>>> [   16.811371] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000=
000000000cc0
> >>>> [   16.818472] x2 : ffff00208c830918 x1 : 0000000000001000 x0 : 0000=
000000000000
> >>>> [   16.825574] Call trace:
> >>>> [   16.828009]  dma_alloc_attrs+0xc0/0xf0
> >>>> [   16.831741]  dma_pool_alloc+0x11c/0x200
> >>>> [   16.835559]  ehci_qh_alloc+0x60/0x12c
> >>>> [   16.839207]  ehci_setup+0x18c/0x40c
> >>>> [   16.842680]  ehci_pci_setup+0xb8/0x680
> >>>> [   16.846412]  usb_add_hcd+0x310/0x5c0
> >>>> [   16.849973]  usb_hcd_pci_probe+0x254/0x36c
> >>>> [   16.854051]  ehci_pci_probe+0x40/0x60
> >>>> [   16.857698]  local_pci_probe+0x48/0xb4
> >>>> [   16.861431]  work_for_cpu_fn+0x24/0x40
> >>>> [   16.865163]  process_one_work+0x1e0/0x450
> >>>> [   16.869155]  worker_thread+0x2cc/0x44c
> >>>> [   16.872886]  kthread+0x114/0x120
> >>>> [   16.876099]  ret_from_fork+0x10/0x20
> >>>> [   16.879657] ---[ end trace 0000000000000000 ]---
> >>>>
> >>>> After reverting this patch the problem resolved. Tested on the lates=
t 6.1-rc1.
> >>>
> >>> OK, I'll queue up a revert of this and one more commit depending on i=
t.
> >>
> >> FWIW it looks like the fix should be as simple as below.
> >>
> >
> > Looks like it's the case. The change works on my platform, now the ehci=
 probed successfully again
> > with no calltrace:
> >
> > Tested-by: Yicong Yang <yangyicong@hisilicon.com>
> >
> >> Robin.
> >>
> >> ----->8-----
> >> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> >> index 558664d169fc..b6962bff1eae 100644
> >> --- a/drivers/acpi/scan.c
> >> +++ b/drivers/acpi/scan.c
> >> @@ -1509,6 +1509,7 @@ int acpi_dma_get_range(struct device *dev, const=
 struct bus_dma_region **map)
> >>               goto out;
> >>           }
> >>
> >> +        *map =3D r;
> >>           list_for_each_entry(rentry, &list, node) {
> >>               if (rentry->res->start >=3D rentry->res->end) {
> >>                   kfree(r);
> >> @@ -1523,8 +1524,6 @@ int acpi_dma_get_range(struct device *dev, const=
 struct bus_dma_region **map)
> >>               r->offset =3D rentry->offset;
> >>               r++;
> >>           }
> >> -
> >> -        *map =3D r;
> >>       }
> >>    out:
> >>       acpi_dev_free_resource_list(&list);
> >>
>
> Ohh, yes, map got a wrong value of r because it has been changed.

Well, please send me a working patch by EOD tomorrow.

> Maybe wo can fix it like this:
>
> truct bus_dma_region *r, *orig_r;
> ...
> orig_r =3D r =3D kcalloc(ret + 1, sizeof(*r), GFP_KERNEL);
> ...
> *map =3D orig_r;
>
> >> .
