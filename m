Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F8C1D540
	for <loongarch@lists.linux.dev>; Sat, 30 Mar 2024 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711808659; cv=none; b=eZb75CjANSPydCB47zC7H8dA4yq+ahfrnvPlVqRaq16u/02ERK01DznoaFUmDlR63Nn15aCFAgPMm8AI/kTnc9Dbd6jV1F3ThDwmVgT8vi3YUwZE/tbSlLaldRmbfXkVn9ipdydUg4MO5MDTHfYBDw+f3EciHWiXfwnSDV5CiEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711808659; c=relaxed/simple;
	bh=RpXyyIUYJRFbE/drwS6Gi5Were0vXBmKDIXy6H9sZWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ROmi04TfGmHlOYDFfOoOFGSu+YirryoFOXD8xRshHTL9Qy/RnNWVSRHuMREGb1H2x6owXAvz28cgRuK43HL39BetkcBT0vD21uTy49uaZ9lOdtLeJ85Wh9KFpFHSlMFMfbag5t7HJtUxDvE9hY7jAGmxOp2MfqYAz78D2mFxLKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VhsZYwqk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VhsZYwqk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711808656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8HbCGyy1GVrVUNL7zlMzVEy/UJRgHTJ0kZQntvsmDig=;
	b=VhsZYwqkzQsUZyo0OdPkV9zY3G4/tckLsctVOLe+11dbutSY+VEAGT1UCf/dPynUXEeFUs
	jTJr3mjQVrEQPofanNM+s2/8aJvCT7n9JJ/nY8sMqrZZkToUf3Fp8eBmbbdbqqWWbOqhP2
	k/jDl/PBSfV5qpEXuZkAht/E9NLAWLI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-oZ4t53_4MXydy8zt9jpAOA-1; Sat,
 30 Mar 2024 10:24:12 -0400
X-MC-Unique: oZ4t53_4MXydy8zt9jpAOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EE4638000A5;
	Sat, 30 Mar 2024 14:24:11 +0000 (UTC)
Received: from localhost (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 468433C20;
	Sat, 30 Mar 2024 14:24:09 +0000 (UTC)
Date: Sat, 30 Mar 2024 22:23:47 +0800
From: Baoquan He <bhe@redhat.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kexec@lists.infradead.org, akpm@linux-foundation.org,
	geert@linux-m68k.org, WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 1/2] arch/loongarch: clean up the left code and Kconfig
 item related to CRASH_CORE
Message-ID: <ZgggcyeJ1bnkfGOp@MiWiFi-R3L-srv>
References: <20240329132825.1102459-1-bhe@redhat.com>
 <20240329132825.1102459-2-bhe@redhat.com>
 <CAAhV-H76-FOvcTXB_rW1B1wFthYK6txVtC+brfzk6nwOhar8iQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H76-FOvcTXB_rW1B1wFthYK6txVtC+brfzk6nwOhar8iQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 03/30/24 at 09:59pm, Huacai Chen wrote:
> Queued, thanks.

Thanks, Huacai. While I noticed Andrew has queued this patchset in his
mm-unstable branch.

> 
> Huacai
> 
> On Fri, Mar 29, 2024 at 9:28 PM Baoquan He <bhe@redhat.com> wrote:
> >
> > In commit 85fcde402db1 ("kexec: split crashkernel reservation code
> > out from crash_core.c"), crashkernel reservation code is split out from
> > crash_core.c, and add CRASH_RESERVE to control it. And also rename each
> > ARCH's <asm/crash_core.h> to <asm/crash_reserve.h> accordingly.
> >
> > But the relevant part in loongarch is missed. Do it now.
> >
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > Cc: Huacai Chen <chenhuacai@kernel.org>
> > Cc: WANG Xuerui <kernel@xen0n.name>
> > Cc: loongarch@lists.linux.dev
> > ---
> >  arch/loongarch/Kconfig                                       | 2 +-
> >  arch/loongarch/include/asm/{crash_core.h => crash_reserve.h} | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >  rename arch/loongarch/include/asm/{crash_core.h => crash_reserve.h} (75%)
> >
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index a5f300ec6f28..54ad04dacdee 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -595,7 +595,7 @@ config ARCH_SELECTS_CRASH_DUMP
> >         select RELOCATABLE
> >
> >  config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
> > -       def_bool CRASH_CORE
> > +       def_bool CRASH_RESERVE
> >
> >  config RELOCATABLE
> >         bool "Relocatable kernel"
> > diff --git a/arch/loongarch/include/asm/crash_core.h b/arch/loongarch/include/asm/crash_reserve.h
> > similarity index 75%
> > rename from arch/loongarch/include/asm/crash_core.h
> > rename to arch/loongarch/include/asm/crash_reserve.h
> > index 218bdbfa527b..a1d9b84b1c7d 100644
> > --- a/arch/loongarch/include/asm/crash_core.h
> > +++ b/arch/loongarch/include/asm/crash_reserve.h
> > @@ -1,6 +1,6 @@
> >  /* SPDX-License-Identifier: GPL-2.0-only */
> > -#ifndef _LOONGARCH_CRASH_CORE_H
> > -#define _LOONGARCH_CRASH_CORE_H
> > +#ifndef _LOONGARCH_CRASH_RESERVE_H
> > +#define _LOONGARCH_CRASH_RESERVE_H
> >
> >  #define CRASH_ALIGN                    SZ_2M
> >
> > --
> > 2.41.0
> >
> 

