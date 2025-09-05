Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A4F18C332
	for <loongarch@lists.linux.dev>; Fri,  5 Sep 2025 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757079116; cv=none; b=NYVohJ/BIVpTPw+W6Z8N3U2T5jOzgMvtWYGZD4eaAHXgTs6BrjppL3ODfxZLgoyLAdNFGXMyo7bbhT8/eSCwQOdP+L9fJ0fauzplpffKT5+3z6ta6nLyLy0Jkxy9WAyxU1Q3vDqzJ/j75RYoHAl/y4EfGkYXN+3UC4Yf3lK42to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757079116; c=relaxed/simple;
	bh=dD2pWAomXulcS3/+dPx3Yrf7QGxwFE4KGaN50EHM08Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=he92tqz+FfTrA3Bw/tQQ7oEHNwiLKkE78oqyKYYpsxF30UN42fuI7kO1Cp+mDUjpTVsAL424yReKzKB3KGyaNYxWXWOW0/kOIG22z79V4mmo/V2gAnxtV982+5U26QFQxPW6B11VYNA5RpgELKNsLtWqnd57DWCm/RoiXqsCvYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFH856v+; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFH856v+"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b2f4ac4786so20793941cf.1
        for <loongarch@lists.linux.dev>; Fri, 05 Sep 2025 06:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757079112; x=1757683912; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30AUT6oybHIq18kHlQCSnYEHacbfTx4Cddlh71/sjbo=;
        b=HFH856v+bpaE4maj2H3XnBZdBg3TUtgzGHiTAMDziiqMk+zlsQvcX7gZaipPBOCcG2
         CkG/Vh2sc01KVh4Sgr2XkQwbfYEe28rDY2d7btkFVEvhRSxzGRQP/qjB9J6Bm8uey7AU
         TFiOF8aew36lPsOZxp2HOV3xAGhzMW1UYf5hHxO4qZmRIfclV8nMDmBAaz7z2Bn9xqtY
         YdA0NR6eIzKByj8wQWE23DXtLyfqkuzTw4iXdMv3+K4xcIOkCmtm8EVIqal6pTbaxDeC
         DMYFhYtwoiQfk7hQhpALsVOZraS2ws07y3jfsyZGgzTPkN4Mlp14K9V1BJbzVUpjlHXp
         mqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079112; x=1757683912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30AUT6oybHIq18kHlQCSnYEHacbfTx4Cddlh71/sjbo=;
        b=BJj7YZN/PAZB6opE0Sr3M0tP5X9+vpttfBpKg2ItBPnUyf4iYz+lTubnlQdsK8CvcE
         oWTczUuJyjipQHqx5JNOHoxssb694NaEf5HrL2R+FYPEIpnByIjgVoyZobYcix5w+qRO
         tHKPgXqCv74Kb1d3oi9dbA1P4YXt1PDBomXAlrzvXZTCnG2vbZ92lrBuD2x2RliW6VrS
         Ba48QFeABSzQGrL3tn25ZGn83yC47jcoMjHgBR0dBuGZEAStZ9D8iP3SMm9Dl9gD56g8
         h0BvaYaM9s6VvLdfwyBY+E9Td/18nOB7kYnt60D+0NygSXaYP74VwAAO1T2xPxQKedO9
         B7Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUQHhHLGqdCodwSPPSmNiJciaDuqooBlxDl+2SXorOg1q9lKVGCZKAVFG1LkEU/Gc/vaNyTlkxgnfc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZqedaVnBqlXaYoqKDM1Q2TscG1E6ONmTGitKySh2bp2T/6iY/
	ZF192aeW4SY67ek96AF5xU+VfDJAII1K3t8J/zh1DYnFLXg68anc1EUD5xGf1Z040yIOtmy00XS
	mCuytL6z8lX2IujygvtCKOdeGTr1oPA4=
X-Gm-Gg: ASbGncv1Jfmmk1GjpvGPDe+D9tJoRbLla9NAOomvwOtqBxa0eNRkdD/tuufBR0TvEh0
	tUvYx9E1boR8MFH4T3q8PZEeo8g8xNLK1121904yDkA2wsndZZYIpl5WAkqN7qSPn8iUhNMtE8f
	cO8fDIsQk/0pL+DEqnqRQnNi3767MiQwue7Y/PcjGgffT7l4fLHXOXGbRIzu2s6X9bsxhSQOD2R
	Mzf6h0Iuhkts6PZ4g==
X-Google-Smtp-Source: AGHT+IEt6aCtE8z5vPljz9s1TGZ8eDMB2c9LDTFXBPOSMZ/UIHmGnDL3XVycTV3DZ3PXIBt5JcrAQzNoByZBWTQLU+E=
X-Received: by 2002:ac8:5890:0:b0:4b2:9510:79ab with SMTP id
 d75a77b69052e-4b31d80cc5emr293434341cf.13.1757079111458; Fri, 05 Sep 2025
 06:31:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2wLLoVW_daqow_ygbut=KnDkPbvG_C8rOoyaiyFMnrPLg@mail.gmail.com>
 <0b697d49-adbb-48d5-bbfa-f90c79fb3a4d@kernel.org> <CAK3+h2xQFeVtkPb+Sr1k+E0Fre+8hi_QfWYd3ueK-2B1FgJmGA@mail.gmail.com>
 <CAK3+h2xx8Zp-tRvw7rG4XjBWd_2D=TqZ=+cRYp9tzuyva0qeXA@mail.gmail.com> <04169545-c40d-4ae1-8fd9-39e4c47472a4@kernel.org>
In-Reply-To: <04169545-c40d-4ae1-8fd9-39e4c47472a4@kernel.org>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Fri, 5 Sep 2025 06:31:37 -0700
X-Gm-Features: Ac12FXz4IDRp9hRggNiMHykOx-iCTzezR5-1gzmeqpGsdE6JG1FJG7O_K5ykTVA
Message-ID: <CAK3+h2y84g=GDnWgFzNc_pLZQEZDPWxuR0YFsbNqsx5u_YoU5w@mail.gmail.com>
Subject: Re: [BUG?] driver stmmac reports page_pool_release_retry() stalled
 pool shutdown every minute
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: Dragos Tatulea <dtatulea@nvidia.com>, netdev@vger.kernel.org, 
	xdp-newbies@vger.kernel.org, loongarch@lists.linux.dev, 
	Furong Xu <0x1207@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>, 
	Philipp Stanner <phasta@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Qunqin Zhao <zhaoqunqin@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 12:59=E2=80=AFAM Jesper Dangaard Brouer <hawk@kernel=
.org> wrote:
>
>
>
> On 02/09/2025 01.27, Vincent Li wrote:
> > On Mon, Sep 1, 2025 at 10:56=E2=80=AFAM Vincent Li <vincent.mc.li@gmail=
.com> wrote:
> >>
> >> On Mon, Sep 1, 2025 at 2:23=E2=80=AFAM Jesper Dangaard Brouer <hawk@ke=
rnel.org> wrote:
> >>>
> >>> On 01/09/2025 04.47, Vincent Li wrote:
> >>>> Hi,
> >>>>
> >>>> I noticed once I attached a XDP program to a dwmac-loongson-pci
> >>>> network device on a loongarch PC, the kernel logs stalled pool messa=
ge
> >>>> below every minute, it seems  not to affect network traffic though. =
it
> >>>> does not seem to be architecture dependent, so I decided to report
> >>>> this to netdev and XDP mailing list in case there is a bug in stmmac
> >>>> related network device with XDP.
> >>>>
> >>>
> >>> Dragos (Cc'ed) gave a very detailed talk[1] about debugging page_pool
> >>> leaks, that I highly recommend:
> >>>    [1]
> >>> https://netdevconf.info/0x19/sessions/tutorial/diagnosing-page-pool-l=
eaks.html
> >>>
> >>> Before doing kernel debugging with drgn, I have some easier steps, I
> >>> want you to perform on your hardware (I cannot reproduce given I don'=
t
> >>> have this hardware).
> >>
> >> I watched the video and slide, I would have difficulty running drgn
> >> since the loongfire OS [0] I am running does not have proper python
> >> support. loongfire is a port of IPFire for LoongArch architecture. The
> >> kernel is upstream stable release 6.15.9  with a backport of LoongArch
> >> BPF trampoline for supporting xdp-tools. I run loongfire on a
> >> LoongArch PC for my home Internet. I tried to reproduce this issue on
> >> the LoongArch PC with a Fedora desktop OS release with the same kernel
> >> 6.15.9, I can't reproduce the issue, not sure if this is only
> >> reproducible for firewall/router like Linux OS with stmmac device.
> >>
> >>>
> >>> First step is to check is a socket have unprocessed packets stalled i=
n
> >>> it receive-queue (Recv-Q).  Use command 'netstat -tapenu' and look at
> >>> column "Recv-Q".  If any socket/application have not emptied it's Rec=
v-Q
> >>> try to restart this service and see if the "stalled pool shutdown" go=
es
> >>> away.
> >>
> >> the Recv-Q shows 0 from  'netstat -tapenu'
> >>
>
> This tell us that is wasn't an easy case of packets waiting in a socket
> queue.  Indicating a higher probability of a driver issue.
>
> >>   [root@loongfire ~]#  netstat -tapenu
> >> Active Internet connections (servers and established)
> >> Proto Recv-Q Send-Q Local Address           Foreign Address
> >> State       User       Inode      PID/Program name
> >> tcp        0      0 127.0.0.1:8953          0.0.0.0:*
> >> LISTEN      0          10283      1896/unbound
> >> tcp        0      0 0.0.0.0:53              0.0.0.0:*
> >> LISTEN      0          10281      1896/unbound
> >> tcp        0      0 0.0.0.0:22              0.0.0.0:*
> >> LISTEN      0          8708       2823/sshd: /usr/sbi
> >> tcp        0    272 192.168.9.1:22          192.168.9.13:58660
> >> ESTABLISHED 0          8754       3004/sshd-session:
> >> tcp6       0      0 :::81                   :::*
> >> LISTEN      0          7828       2841/httpd
> >> tcp6       0      0 :::444                  :::*
> >> LISTEN      0          7832       2841/httpd
> >> tcp6       0      0 :::1013                 :::*
> >> LISTEN      0          7836       2841/httpd
> >> tcp6       0      0 10.0.0.229:444          192.168.9.13:58762
> >> TIME_WAIT   0          0          -
> >> udp        0      0 0.0.0.0:53              0.0.0.0:*
> >>           0          10280      1896/unbound
> >> udp        0      0 0.0.0.0:67              0.0.0.0:*
> >>           0          10647      2803/dhcpd
> >> udp        0      0 10.0.0.229:68           0.0.0.0:*
> >>           0          8644       2659/dhcpcd: [BOOTP
> >> udp        0      0 10.0.0.229:123          0.0.0.0:*
> >>           0          8679       2757/ntpd
> >> udp        0      0 192.168.9.1:123         0.0.0.0:*
> >>           0          8678       2757/ntpd
> >> udp        0      0 127.0.0.1:123           0.0.0.0:*
> >>           0          8677       2757/ntpd
> >> udp        0      0 0.0.0.0:123             0.0.0.0:*
> >>           0          8670       2757/ntpd
> >> udp        0      0 0.0.0.0:514             0.0.0.0:*
> >>           0          5689       1864/syslogd
> >> udp6       0      0 :::123                  :::*
> >>           0          8667       2757/ntpd
> >>
> >>> Second step is compiling kernel with CONFIG_DEBUG_VM enabled. This wi=
ll
> >>> warn us if the driver leaked the a page_pool controlled page, without
> >>> first "releasing" is correctly.  See commit dba1b8a7ab68 ("mm/page_po=
ol:
> >>> catch page_pool memory leaks") for how the warning will look like.
> >>>    (p.s. this CONFIG_DEBUG_VM have surprisingly low-overhead, as long=
 as
> >>> you don't select any sub-options, so we choose to run with this in
> >>> production).
> >>>
> >>
> >> I added CONFIG_DEBUG_VM and recompiled the kernel, but no kernel
> >> warning message about page leak, maybe false positive?
> >>
>
> This just tells us that the inflight page_pool page wasn't "illegality"
> returned to the MM-subsystem.  So, this page is stuck somewhere in the
> system, still "registered" to a page_pool instance. This is even more
> indication of a driver bug.
>
> We are almost out of easy options to try.  The last attempt I want you
> to try is to unload the NIC drivers kernel module (via rmmod).  And then
> wait to see if the "stalled pool shutdown" messages disappears. I hope
> you have some serial console, so you can still observe the kernel log.
>

rmmod the driver kernel module while the XDP program is attached? if I
detach the XDP program, the message disappears.

> If the "stalled pool shutdown" messages continue, then we have to use
> the techniques as Dragos did.
>
> Basically scanning all page's in memory looking for PP_SIGNATURE bit.
> Here is some example[1] code that walks all memory pages from the kernel
> side.  This doesn't actually work as a kernel module... if I was you, I
> would just copy-paste this into the driver or page_pool, and call it
> when we see the stalled messages.  This will help us identify the
> page_pool page. (After which I would use Drgn to investigate the state).
>
> [1]
> https://github.com/netoptimizer/prototype-kernel/blob/master/kernel/mm/be=
nch/page_bench06_walk_all.c#L68-L97
>
can I insert the code in page_pool_release_retry() below right after
the pr_warn() message line 1187?  What should I print or do in the
above code if ((page->pp_magic & ~0x3UL) =3D=3D PP_SIGNATURE) block?

1164 static void page_pool_release_retry(struct work_struct *wq)
1165 {
1166         struct delayed_work *dwq =3D to_delayed_work(wq);
1167         struct page_pool *pool =3D container_of(dwq, typeof(*pool),
release_dw);
1168         void *netdev;
1169         int inflight;
1170
1171         inflight =3D page_pool_release(pool);
1172         /* In rare cases, a driver bug may cause inflight to go negati=
ve.
1173          * Don't reschedule release if inflight is 0 or negative.
1174          * - If 0, the page_pool has been destroyed
1175          * - if negative, we will never recover
1176          * in both cases no reschedule is necessary.
1177          */
1178         if (inflight <=3D 0)
1179                 return;
1180
1181         /* Periodic warning for page pools the user can't see */
1182         netdev =3D READ_ONCE(pool->slow.netdev);
1183         if (time_after_eq(jiffies, pool->defer_warn) &&
1184             (!netdev || netdev =3D=3D NET_PTR_POISON)) {
1185                 int sec =3D (s32)((u32)jiffies -
(u32)pool->defer_start) / HZ;
1186
1187                 pr_warn("%s() stalled pool shutdown: id %u, %d
inflight %d sec\n",
1188                         __func__, pool->user.id, inflight, sec);
1189                 pool->defer_warn =3D jiffies + DEFER_WARN_INTERVAL;
1190         }
1191
1192         /* Still not ready to be disconnected, retry later */
1193         schedule_delayed_work(&pool->release_dw, DEFER_TIME);
1194 }

>
> >> [root@loongfire ~]# grep 'CONFIG_DEBUG_VM=3Dy' /boot/config-6.15.9-ipf=
ire
> >>
> >> CONFIG_DEBUG_VM=3Dy
> >>
> >> [root@loongfire ~]# grep -E 'MEM_TYPE_PAGE_POOL|stalled' /var/log/kern=
.log
> >>
> >> Sep  1 10:23:19 loongfire kernel: [    7.484986] dwmac-loongson-pci
> >> 0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
> >> Sep  1 10:26:44 loongfire kernel: [  212.514302] dwmac-loongson-pci
> >> 0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
> >> Sep  1 10:27:44 loongfire kernel: [  272.911878]
> >> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 60
> >> sec
> >> Sep  1 10:28:44 loongfire kernel: [  333.327876]
> >> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 120
> >> sec
> >> Sep  1 10:29:45 loongfire kernel: [  393.743877]
> >> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 181
> >> sec
> >>
> >
> > I came up a fentry bpf program [0]
> > https://github.com/vincentmli/loongfire/issues/3 to trace the netdev
> > value in page_pool_release_retry():
> >
> >          /* Periodic warning for page pools the user can't see */
> >          netdev =3D READ_ONCE(pool->slow.netdev);
> >          if (time_after_eq(jiffies, pool->defer_warn) &&
> >              (!netdev || netdev =3D=3D NET_PTR_POISON)) {
> >                  int sec =3D (s32)((u32)jiffies - (u32)pool->defer_star=
t) / HZ;
> >
> >                  pr_warn("%s() stalled pool shutdown: id %u, %d
> > inflight %d sec\n",
> >                          __func__, pool->user.id, inflight, sec);
> >                  pool->defer_warn =3D jiffies + DEFER_WARN_INTERVAL;
> >          }
> >
> > The bpf program prints netdev  NULL, I wonder if there is left over
> > page pool allocated initially by the stmmac driver, and  after
> > attaching XDP program, the page pool allocated initially had netdev
> > changed to NULL?
> >
> > Page Pool: 0x900000010b54f000
> >    netdev pointer: 0x0
> >    is NULL: YES
> >    is NET_PTR_POISON: NO
> >    condition (!netdev || netdev =3D=3D NET_PTR_POISON): TRUE
> >
> > Page Pool: 0x900000010b54f000
> >    netdev pointer: 0x0
> >    is NULL: YES
> >    is NET_PTR_POISON: NO
> >    condition (!netdev || netdev =3D=3D NET_PTR_POISON): TRUE
> >
> >>> Third step is doing kernel debugging like Dragos did in [1].
> >>>
> >>> What kernel version are you using?
> >>
> >> kernel 6.15.9
> >>
>
> Nice, that is a very recent kernel.
> The above shows us that we are indeed hitting the issue of a "hidden"
> page_pool instance (related to the page_pool commit Jakub/Kuba added).
>
>
> >>>
> >>> In kernel v6.8 we (Kuba) silenced some of the cases.  See commit
> >>> be0096676e23 ("net: page_pool: mute the periodic warning for visible
> >>> page pools").
> >>> To Jakub/kuba can you remind us how to use the netlink tools that can
> >>> help us inspect the page_pools active on the system?
> >>>
> >>>
> >>>> xdp-filter load green0
> >>>>
> >>>
> >>> Most drivers change memory model and reset the RX rings, when attachi=
ng
> >>> XDP.  So, it makes sense that the existing page_pool instances (per R=
Xq)
> >>> are freed and new allocated.  Revealing any leaked or unprocessed
> >>> page_pool pages.
> >>>
> >>>
> >>>> Aug 31 19:19:06 loongfire kernel: [200871.855044] dwmac-loongson-pci=
 0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
> >>>> Aug 31 19:19:07 loongfire kernel: [200872.810587] page_pool_release_=
retry() stalled pool shutdown: id 9, 1 inflight 200399 sec
> >>>
> >>> It is very weird that a stall time of 200399 sec is reported. This
> >>> indicate that this have been happening *before* the xdp-filter was
> >>> attached. The uptime "200871.855044" indicate leak happened 472 sec
> >>> after booting this system.
> >>>
> >>
> >> Not sure if I pasted the previous log message correctly, but this time
> >> the log I pasted should be correct,
> >>
> >>> Have you seen these dmesg logs before attaching XDP?
> >>
> >> I didn't see such a log before attaching XDP.
> >>
>
>  From above we have established, that it makes sense, as the mentioned
> commit would have "blocked it" from being printed.
>
> >>>
> >>> This will help us know if this page_pool became "invisible" according=
 to
> >>> Kuba's change, if you run kernel >=3D v6.8.
> >>>
> >>>
> >>>> Aug 31 19:20:07 loongfire kernel: [200933.226488] page_pool_release_=
retry() stalled pool shutdown: id 9, 1 inflight 200460 sec
> >>>> Aug 31 19:21:08 loongfire kernel: [200993.642391]
> >>>> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
> >>>> 200520 sec
> >>>> Aug 31 19:22:08 loongfire kernel: [201054.058292]
> >>>> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
> >>>> 200581 sec
> >>>>
> >>>
> >>> Cc'ed some people that might have access to this hardware, can any of
> >>> you reproduce?
> >>>
>
> Anyone with this hardware?
>
> >>
> >> [0]: https://github.com/vincentmli/loongfire
>
> --Jesper
