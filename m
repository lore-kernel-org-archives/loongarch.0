Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6B5248F72
	for <loongarch@lists.linux.dev>; Sun, 26 Jul 2026 02:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785032793; cv=none; b=We/O+MlnwKqInoBpTnXfXnIphhy28ylYYEwZnI8psRWwpUxwXzqDO/MqbdKRv3UhOJp2YHU/PReBZ20Y1sKQD7om3jrBXrrtThyTD+9RVad977j4aDwnVuV7O3kcrIV41TdxJzJjf8pSvLM+mnCuGo9S0IDlx6xAJ6h/THGHvbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785032793; c=relaxed/simple;
	bh=E/7xw/lNzKjmHwWvbeVGsO8LXCGXggi5GevW5q3cYsg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K9SLdJMRG5F/TL+FcLTYkICa6+v+O+p3JEz1YwGmb1UV9AFAg7PDgeQOpfC83MWWYOYJPeVbATks/84z/GyXP2MDzno+vbkWa1T1bv4fIEAnkqHXsgho8QW25UQjzXSU8aYocN4xBNNSKmwwComefS6KjQsrrCZ+V/N5PFYl8cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=Vsnk0vlJ; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="Vsnk0vlJ"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 1599BC371A;
	Sun, 26 Jul 2026 05:26:25 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 1599BC371A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1785032787;
	bh=gnMBo/Lp6RvtqdAYnnfN14fPjO9OQx4DZDDTcSRGUrY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Vsnk0vlJcVzmXuaf1KWbCTkO34eoi+75ucd1J1F8B9aIyCl/J9TfxkErQlzZQ3GqC
	 i5vqhxzn46WOGBC96AlmFHFzuqxGLskvlsVxhWBt5S8PrTXiFHgMea74Bp8Mm6302k
	 ErRS1yqUVutPFkFSZuNBZMrxfLkIUvBN0NAgODWfj/IbAa4kLOeCUk1Vzteddn1+ef
	 iKgJsyv7iFzL0j/sRk4FP2gfX+DWgwV2tvcNJeKVB7ztXhCOi9zMVmRbQaZsQ5EQCg
	 gz3hQALFYAdmCb+qDdG12DUOpoOA883AgvNCDxpGOxAWQzKX5BaA1aGdUss+75ZJqv
	 s11OJ3JtTQ0Wg==
Message-ID: <49d30d0cf504d762dca08e35237eb11f0d7c53b2.camel@rendec.net>
Subject: Re: [PATCH 02/16] irqchip/loongarch-ir: fix redirect free and alloc
 leaks
From: Radu Rendec <radu@rendec.net>
To: Haofeng Li <lihaofeng@kylinos.cn>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>, Huacai
 Chen	 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Tianyang
 Zhang	 <zhangtianyang@loongson.cn>, Liupu Wang <wangliupu@loongson.cn>, 
	loongarch@lists.linux.dev
Date: Sat, 25 Jul 2026 22:26:24 -0400
In-Reply-To: <20260714122351.3274006-3-lihaofeng@kylinos.cn>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
	 <20260714122351.3274006-3-lihaofeng@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-07-14 at 20:23 +0800, Haofeng Li wrote:
> redirect_irde_free() ignores its irde argument and always frees
> redirect_descs (node 0). Multi-node teardown therefore leaks non-zero
> nodes.
>=20
> On the alloc path, a failed redirect_table_alloc() after
> irq_domain_alloc_irqs_parent() returns without freeing parent IRQs.
> A mid-loop gpid allocation failure also leaks the current item (chip_data
> is not set yet) and never releases the bitmap region obtained from
> bitmap_find_free_region().
>=20
> Free &irde->ird_table and &irde->inv_queue, free parent IRQs on table
> alloc failure, kfree(item) on gpid failure, and release the full bitmap
> region on the error path.
>=20
> Fixes: 71619266e0a2 ("irqchip/loongarch-ir: Add IR (interrupt redirection=
) irqchip support")
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> ---
> =C2=A0drivers/irqchip/irq-loongarch-ir.c | 21 +++++++++++++++++++--
> =C2=A01 file changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-loongarch-ir.c b/drivers/irqchip/irq-loo=
ngarch-ir.c
> index 21c649a89a70..695dfef6570a 100644
> --- a/drivers/irqchip/irq-loongarch-ir.c
> +++ b/drivers/irqchip/irq-loongarch-ir.c
> @@ -219,6 +219,20 @@ static int redirect_table_alloc(int node, u32 nr_irq=
s)
> =C2=A0 return index;
> =C2=A0}
> =C2=A0
> +static void redirect_table_free_region(int node, int index, u32 nr_irqs)
> +{
> + struct redirect_table *ird_table =3D &redirect_descs[node].ird_table;
> + int order =3D 0;
> +
> + if (nr_irqs > 1) {
> + nr_irqs =3D __roundup_pow_of_two(nr_irqs);
> + order =3D ilog2(nr_irqs);
> + }
> +
> + guard(raw_spinlock_irqsave)(&ird_table->lock);
> + bitmap_release_region(ird_table->bitmap, index, order);
> +}
> +
> =C2=A0static void redirect_table_free(struct redirect_item *item)
> =C2=A0{
> =C2=A0 struct redirect_table *ird_table =3D &item->irde->ird_table;
> @@ -324,6 +338,7 @@ static int redirect_domain_alloc(struct irq_domain *d=
omain, unsigned int virq,
> =C2=A0 index =3D redirect_table_alloc(node, nr_irqs);
> =C2=A0 if (index < 0) {
> =C2=A0 pr_err("Alloc redirect table entry failed\n");
> + irq_domain_free_irqs_parent(domain, virq, nr_irqs);
> =C2=A0 return -EINVAL;
> =C2=A0 }
> =C2=A0
> @@ -347,6 +362,7 @@ static int redirect_domain_alloc(struct irq_domain *d=
omain, unsigned int virq,
> =C2=A0 item->gpid =3D kzalloc_node(sizeof(*item->gpid), GFP_KERNEL, node)=
;
> =C2=A0 if (!item->gpid) {
> =C2=A0 pr_err("Alloc redirect GPID failed\n");
> + kfree(item);
> =C2=A0 goto out_free_resources;
> =C2=A0 }
> =C2=A0 item->index =3D index + i;
> @@ -361,6 +377,7 @@ static int redirect_domain_alloc(struct irq_domain *d=
omain, unsigned int virq,
> =C2=A0
> =C2=A0out_free_resources:
> =C2=A0 redirect_free_resources(domain, virq, nr_irqs);
> + redirect_table_free_region(node, index, nr_irqs);

I think this is a bit more subtle. The bitmap entries are already
released via redirect_free_resources() -> redirect_table_free() but the
problem is some of them may not released, for one of the following
reasons:
   1. The allocation loop above has ended early due to a kzalloc()
      failure.
   2. nr_irqs is not a power of 2 and has been rounded up in
      redirect_table_alloc(), making the actual bitmap region larger.

Your proposed change addresses both scenarios, but makes the spinlock
locking and the clear_bit() in redirect_table_free() redundant. I'm
more concerned about the spinlock locking, because it also disables the
interrupts - for each step of the loop in redirect_free_resources().

On the other hand, I think a bitmap entry leak is still possible in
redirect_domain_free(), which you're not addressing. For example,
suppose redirect_domain_alloc() is called with nr_irqs=3D5 and is
successful. That allocates 8 entries in the bitmap. Then, even if
redirect_domain_free() is called with the same virq and nr_irqs (which,
by the way, is not guaranteed), only the first 5 entries of that region
of 8 will be released.

My point is this driver has a deeper design flaw around that bitmap. In
reality, it probably doesn't matter because the bitmap is huge (64K
bits), and interrupts are unlikely to be removed and reallocated in
large enough amounts to exhaust the bitmap. But if you really want to
fix this, better address the underlying design flaw and fix it
properly.

> =C2=A0 irq_domain_free_irqs_common(domain, virq, nr_irqs);
> =C2=A0
> =C2=A0 return -ENOMEM;
> @@ -436,8 +453,8 @@ static void redirect_irde_cfg(struct redirect_desc *i=
rde)
> =C2=A0
> =C2=A0static void __init redirect_irde_free(struct redirect_desc *irde)
> =C2=A0{
> - struct redirect_table *ird_table =3D &redirect_descs->ird_table;
> - struct redirect_queue *inv_queue =3D &redirect_descs->inv_queue;
> + struct redirect_table *ird_table =3D &irde->ird_table;
> + struct redirect_queue *inv_queue =3D &irde->inv_queue;
> =C2=A0
> =C2=A0 if (ird_table->table) {
> =C2=A0 folio_put(virt_to_folio(ird_table->table));
